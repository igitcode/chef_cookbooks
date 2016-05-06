
service "nginx" do
   action :nothing
end

cookbook_file '/apps/python/aws/nginx.conf' do
   source 'nginx.conf'
   owner 'ec2-user'
   group 'ec2-user'
   mode '0755'
   action :create_if_missing
   notifies :start, 'service[nginx]' 
end

#deploy 'nginx.conf' do
#   repo 'https://github.com/igitcode/app_server_config.git' 
#   deploy_to '/apps/python/aws/'
#   environment 'APP_ENV' => 'dev' 
#   action :deploy
#   symlinks(
#      "/apps/pythons/aws/nginx.conf" => "/etc/nginx/conf.d/nginx.conf"
#   ) 
#
#   notifies :start, 'service[nginx]'
#end
