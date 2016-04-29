package 'docker.x86_64' do
  action :install
end

group 'docker' do
  action :modify
  members 'ec2-user'
  append true
end

