#
# Cookbook Name:: custom_apache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'httpd' do
action :install
end 
service 'httpd' do 
action [ :enable, :start ]
end
cookbook_file '/var/www/html/index.html' do
source 'index.html'
mode 644
end
