# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements. See the NOTICE file distributed with this
# work for additional information regarding copyright ownership. The ASF
# licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

module Accessitude
  extend ActiveSupport::Concern
  
  module ClassMethods
    def accessitude
      
      # Array of all accessible attributes
      # @return [Array]
      define_method :accessitude_attrs do
        self.class.accessitude_attrs
      end

      # Check if any of the accessible attributes are not _blank_
      # @return [Boolean]
      define_method :has_accessitude_data do
        self.attributes.values_at( *self.accessitude_attrs ).compact.delete_if { |attr| attr.blank? }.size > 0
      end
      
      # Set attributes of instance only using attr_accessible params
      define_method :attributes_from_params do |params|
        self.attributes = params.slice(*accessitude_attrs)
      end
      
      class << self
        
        # Array of all accessible attributes
        # @return [Array]
        def accessitude_attrs
          self.attr_accessible[:default].to_a - ['','default','_destroy']
        end
        
        # Create a new instance only using attr_accessible params
        def new_from_params(params)
          self.create( params.slice(*accessitude_attrs) )
        end        
        
      end          
    end
  end
end

ActiveRecord::Base.send :include, Accessitude