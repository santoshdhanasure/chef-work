#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

platform = node["platform_family"]

puts platform

case node["platform_family"]

when "ubuntu"

package "apache2" do
	action :install
end

service "apache2" do
	action [ :enable, :start]
end

when "rhel"

package "httpd" do
	action :install
end

service "httpd" do
	action [ :enable, :start ]
end

else
	Chef::Log.warn "#{node['platform_family']} not supported yet." if Chef::Log.warn?
end

#template "/var/www/html/index.html" do
#	action :create
#	mode "0644"
# 	owner "root"
#	group "root"
#end
