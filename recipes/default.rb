include_recipe 'python'

package 'git'

user node[:aminator][:user]

directory '/var/log/aminator' do
  owner node[:aminator][:user]
  group node[:aminator][:user]
end

directory '/var/aminator/lock' do
  owner node[:aminator][:user]
  group node[:aminator][:user]
end

python_virtualenv node[:aminator][:root] do
  action :create
end

python_pip node[:aminator][:package] do
  package_name 'aminator'
  virtualenv node[:aminator][:root]
  action :install
end

