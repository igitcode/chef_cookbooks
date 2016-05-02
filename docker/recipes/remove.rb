
group 'docker' do
  action :modify
  members 'ec2-user'
  append false 
end


package 'docker.x86_64' do
  action :remove
end
