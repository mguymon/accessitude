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

require 'spec_helper'
require 'accessitude'
require 'message'

describe Accessitude do

  describe "Class" do
      it "should list accessible attributes" do
        Message.accessitude_attrs.should eql ["title", "desc", "body"]
      end
  end
  
  describe "Instance" do
    subject {
      message = Message.new
      message.title = 'title'
      message.desc = 'desc'
      message.body = 'body'
      message.hamster = 'hamster'
      message
    }
    
    it "should list accessible attributes" do
      subject.accessitude_attrs.should eql ["title", "desc", "body"]
    end    
    
    it "should update instance attributes from params" do
      params = {"one" => "one", "two" => "two", "title" => "test title", "body" => "test body", "hamster"=>"not set"}
      subject.attributes_from_params(params)
      subject.title.should eql "test title"
      subject.desc.should eql "desc"
      subject.body.should eql "test body"
      subject.hamster.should eql "hamster"
    end

    it "should have accessitude data" do
      Message.new.has_accessitude_data.should be_false
      subject.has_accessitude_data.should be_true
    end
  end  
  
  describe "New" do
    subject { Message }
    
    it "should create using accessitude attributes" do
      params = {"one" => "one", "two" => "two", "title" => "title", "body" => "body", "hamster"=>"not set"}
      instance = subject.new_from_params(params)
      instance.title.should eql "title"
      instance.body.should eql "body"
      instance.desc.should be_nil
      instance.hamster.should be_nil
    end
  end
end 