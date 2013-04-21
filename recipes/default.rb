include_recipe 'python'

package 'git'

user node[:aminator][:user]

directory node[:aminator][:root] do
  owner node[:aminator][:user]
  recursive true
end

python_virtualenv node[:aminator][:root] do
  owner node[:aminator][:user]
  action :create
end

python_pip node[:aminator][:package] do
  package_name 'aminator'
  virtualenv node[:aminator][:root]
  action :install
end

