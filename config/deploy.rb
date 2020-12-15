# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, "todo-app"
set :repo_url, "git@github.com:Rubycom-Free-IT/todo-app.git"

set :deploy_to, "/home/deploy/#{fetch :application}"

set :rvm_type, :user
set :rvm_ruby_version, '2.6.3@todo-app'

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
append :linked_files, "config/master.key", "db/production.sqlite3"

set :keep_releases, 10

task 'master_key:copy' do
  on roles(:all) do
    execute :mkdir, "-p #{shared_path}/config"
    upload! 'config/master.key', "#{shared_path}/config/master.key"
  end
end
