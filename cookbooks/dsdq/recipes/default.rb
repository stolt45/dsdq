require 'pp'
#
# Cookbook Name:: dsdq
# Recipe:: default
#

#execute "emerge-pdftex"
#  command "emerge -ug pdftex"
#  action :run
#end

remote_file "/engineyard/bin" do
  owner "root"
  group "root"
  mode 0755
  source "dsdq"
  action :create
end

remote_file "/etc/monit.d/" do
  owner "root"
  group "root"
  mode 0755
  source "dsqd.dictionarysquared.monitrc"
  action :create
end

execute "restart-monit"
  commad "/etc/init.d/monit restart"
  action :run
end

