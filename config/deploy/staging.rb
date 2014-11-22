role :app, %w{deployer@188.226.245.139}
role :web, %w{deployer@188.226.245.139}
role :db,  %w{deployer@188.226.245.139}

set :application, 'marine'
set :branch, 'develop'
set :deploy_to, "/home/deployer/staging/#{fetch(:application)}"

# And/or per server (overrides global)
# ------------------------------------
server '188.226.245.139',
       user: 'deployer',
       roles: %w{web app},
       ssh_options: {
         user: 'deployer', # overrides user setting above
         #keys: %w(/home/deployer/.ssh/id_rsa),
         forward_agent: true,
         auth_methods: %w(publickey password)
         # password: 'please use keys'
       }
