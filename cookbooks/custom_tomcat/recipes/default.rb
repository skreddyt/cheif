#
# Cookbook Name:: custom_tomcat
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
download_url = 'https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.72/bin/apache-tomcat-7.0.72.zip'

group node['tomcat']['group'] do
 
user node['tomcat']['user'] do
group node['tomcat']['group']
system true
shell '/bin/bash'
end

ark 'tomcat' do
 url 'download_url'
 home_dir '/opt/tomcat'
 owner node['tomcat']['user']
 group group node['tomcat']['group']
end

dist_dir, _conf_dir = value_for_platform_family(
  ['debian'] => %w( debian default ),
  ['rhel'] => %w( redhat sysconfig )
  )
  
  
  template '/etc/init.d/tomcat' do
  source "#{dist_dir}/tomcat-init.erb"
  mode '0775'
  owner 'root'
  group 'root'
  notifies :enable, 'service[tomcat]', :delayed
  notifies :restart, 'service[tomcat]', :delayed
end

execute "chmod" do
   command "chmod 755 /opt/tomcat/bin/*.sh"
   action :run
  end
  
service 'tomcat' do
 supports restart: true
 action [ :enable, :start]
end

execute "chkconfig" do
 command " chkconfig tomcat on"
 command " service tomcat start"
 action :run
