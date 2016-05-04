
service "nginx" do
   action :nothing
end

deploy 'nginx.conf' do
   repo 'https://github.com/igitcode/app_server_config.git' 
   deploy_to '/apps/python/aws/'
   environment 'APP_ENV' => 'dev' 
   action :deploy
   symlinks(
      "/apps/pythons/aws/nginx.conf" => "/etc/nginx/conf.d/nginx.conf"
   ) 

   notifies :start, 'service[nginx]'
end
