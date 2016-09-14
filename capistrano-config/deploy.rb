namespace :deploy do
  task :print_targets do
    servers = Capistrano::Configuration.env.filter(release_roles(:all))
    servers.each {|server| 
      puts server.hostname
    }
    exit 0
  end
end

before 'deploy:starting', 'deploy:print_targets'
