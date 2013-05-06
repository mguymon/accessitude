# Accessitude

### Don't tell me what params ! need, I will tell you!

A helper for Rails that will select only accessible parameters to be passed to a Model.

https://github.com/mguymon/accessitude

[RDoc](http://rubydoc.info/gems/accessitude/frames)

## Install

    gem install acessitude

## Rails Usage

Now add to models that you want to have `Accessitude`:

    require 'accessitude'
    class Message < ActiveRecord::Base
      accessitude
      
      attr_accessible :title, :body, :desc
    end
    
Now you can create a new instance in a Controller and simply pass in the entire `param` hash. Accessitude will only select params that have been set in the model's `attr_accessible`:

    Message.create_from_params(params)
    
Also you can update an existing instance:
    
    @message.attributes_from_params(params)

To get a list of accessible_attrs:
    
    Message.accessitude_attrs
    
## License

Licensed to the Apache Software Foundation (ASF) under one or more
contributor license agreements.  See the NOTICE file distributed with this
work for additional information regarding copyright ownership.  The ASF
licenses this file to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
License for the specific language governing permissions and limitations under
the License.
