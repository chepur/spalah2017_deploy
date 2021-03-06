# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "spalah2017"
set :repo_url, "https://github.com/shved270189/spalah2017_deploy.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/spalah2017/spalah2017"

set :rvm_type, :user                     # Defaults to: :auto
set :rvm_ruby_version, 'ruby-2.3.0'      # Defaults to: 'default'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
append :linked_files,
       "config/database.yml",
       "config/secrets.yml",
       "db/production.sqlite3"

# Default value for linked_dirs is []
append :linked_dirs,
       "log",
       "tmp/pids",
       "tmp/cache",
       "tmp/sockets",
       "public/system",
       "public/images",
       "public/uploads"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
