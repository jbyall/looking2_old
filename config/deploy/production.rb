set :stage, :production
server 'ec2-52-86-109-24.compute-1.amazonaws.com', user: 'deploy', roles: %w{web app db}
