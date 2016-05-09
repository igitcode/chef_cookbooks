
#create python virtual env
directory '/apps/chef_test/python/env' do
   owner 'ec2-user'
   group 'ec2-user'
   mode '0775'
   action :create
   recursive true
end

# create python application dir
#### trying to loop thru apps defined in attributes file
node.default[:python_apps].each do |app|
   directory '/apps/chef_test/python/env/sites/#{app}' do
      owner 'ec2-user'
      group 'ec2-user'
      mode '0775'
      action :create
      recursive true
   end
end
# copy nginx server conf file
cookbook_file '/apps/chef_test/python/nginx.conf' do
   source 'nginx.conf'
   owner 'ec2-user'
   group 'ec2-user'
   mode '0664'
   action :create_if_missing
end

# copy uWGCI conf file
cookbook_file '/apps/chef_test/python/uwsgi.ini' do
   source 'uwsgi.ini'
   owner 'ec2-user'
   group 'ec2-user'
   mode '0664'
   action :create_if_missing
end

service "nginx" do
   action :start
end

#deploy 'nginx.conf' do
#   environment 'APP_ENV' => 'dev' 
#   action :deploy
#   symlinks(
#      "/apps/pythons/aws/nginx.conf" => "/etc/nginx/conf.d/nginx.conf"
#   ) 
#
#   notifies :start, 'service[nginx]'
#end
