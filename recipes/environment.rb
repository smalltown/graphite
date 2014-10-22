#
# Cookbook Name:: graphite
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# install apache http server
include_recipe "apache2"
include_recipe "apache2::mod_wsgi"

# install mysql server and client
include_recipe "mysql::client"
include_recipe "mysql::server"

# include mysql gem
include_recipe "database::mysql"

# mysql connection string
mysql_connection_info = {
  :host     => node['graphite']['mysql']['host'],
  :username => 'root',
  :port     => node['graphite']['mysql']['port'],
  :password => node['mysql']['server_root_password']
}

# create database for graphite
mysql_database node['graphite']['mysql']['database'] do
  connection mysql_connection_info
  action :create
end

# create user for graphite database
mysql_database_user node['graphite']['mysql']['user'] do
  connection mysql_connection_info
  password node['graphite']['mysql']['password']
  action :create
end

# grant permission for graphite
mysql_database_user node['graphite']['mysql']['user'] do
  connection mysql_connection_info
  password node['graphite']['mysql']['password']
  database_name node['graphite']['mysql']['database']
  host node['graphite']['mysql']['host']
  privileges [:all]
  action :grant
end

# flush the privileges
mysql_database 'flush the privileges' do
  connection mysql_connection_info
  sql        'flush privileges'
  action     :query
end

# install MySQL-python
yum_package "MySQL-python" do
  action :install
end

