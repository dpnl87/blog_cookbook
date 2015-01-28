#
# Cookbook Name:: blog
# Recipe:: default
#
# Copyright 2015, Daniel Paulus
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
node.set['nginx']['version'] = '1.7.9'
node.set['nginx']['install_method'] = 'source'

sha256 = '1aafc7f0f530ddaa86d4ba24c14941ce0a584cc896f8261d6218f99625318f8a'
node.set['nginx']['source']['version'] = '1.7.9'
node.set['nginx']['source']['url'] = 'http://nginx.org/download/nginx-1.7.9.tar.gz'
node.set['nginx']['source']['checksum'] = sha256
node.set['nginx']['source']['default_configure_flags'] = %w(
  --prefix=/usr/local/nginx
  --conf-path=/etc/nginx/nginx.conf
  --sbin-path=/usr/local/sbin/
)
node.set['nginx']['source']['modules'] = %w(
  nginx::http_ssl_module
  nginx::http_gzip_static_module
  nginx::http_spdy_module
)
node.set['nginx']['log_dir'] = '/var/log/nginx'
node.override['nginx']['binary'] = '/usr/local/sbin/nginx'
node.set['nginx']['default_site_enabled'] = true
include_recipe 'nginx::source'
