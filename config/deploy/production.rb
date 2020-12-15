set :branch, :master
set :rails_env, :production

server '95.217.160.119', user: 'deploy', roles: %w[app db web]
