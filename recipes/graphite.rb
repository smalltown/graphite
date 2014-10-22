#
# Cookbook Name:: graphite
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

#install graphite
yum_package "graphite-web" do
  version node['graphite']['web']['version']
  action :install
end

yum_package "graphite-web-selinux" do
  version node['graphite']['web-selinux']['version']
  action :install
end

template "/usr/lib/python2.6/site-packages/graphite/initial_data.json" do
  source 'initial_data.json.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template "/etc/graphite-web/local_settings.py" do
  source 'local_settings.py.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :run, "execute[sync-graphite-db]", :immediately
end

execute "sync-graphite-db" do
  command "/usr/lib/python2.6/site-packages/graphite/manage.py syncdb --noinput"
  creates "/etc/graphite-web/syncdbed"
  action :nothing
end

web_app "graphite-web" do
  template 'graphite-web.conf.erb'
end

yum_package "python-carbon" do
  version node['graphite']['python-carbon']['version']
  action :install
end

yum_package "python-whisper" do
  version node['graphite']['python-whisper']['version']
  action :install
end

template "/etc/carbon/storage-schemas.conf" do
  source 'storage-schemas.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'carbon-cache' do
  supports :restart => true, :reload => true
  action :enable
  subscribes :restart, "template[/etc/carbon/storage-schemas.conf]", :immediately
end
