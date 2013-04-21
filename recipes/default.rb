include_recipe 'python'

user node[:aminator][:user]

python_virtualenv node[:aminator][:root] do
  owner node[:aminator][:user]
end

python_pip node[:aminator][:package] do
  package_name 'aminator'
  virtualenv node[:aminator][:root]
end

