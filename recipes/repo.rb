#
# Cookbook Name:: osops-utils
# Recipe:: repo
#
# Copyright 2012, DreamHost
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

def essex_release
# Do stuff
end

def folsom_release
  case node[:platform]
  when "ubuntu"
    apt_repository "ceph" do
      uri node["openstack"]["folsom"]["ubuntu"]["repo"]
      distribution node['lsb']['codename']
      components ["main"]
      key node["openstack"]["folsom"]["ubuntu"]["key"]
      action :add
    end # apt_repository
  end # platform
end

# Main Logic
if ! node["openstack"].nil?
  if ! node["openstack"]["release"].nil?
    case node["openstack"]["release"]
      when "essex"
        essex_release
      when "folsom"
        folsom_release
    end # release
  end # node["openstack"]["release"].nil?
end # node["openstack"].nil?
