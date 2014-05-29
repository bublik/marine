# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{deployer@188.226.245.139}
role :web, %w{deployer@188.226.245.139}
role :db,  %w{deployer@188.226.245.139}

set :application, 'marine'
set :branch, 'master'
set :deploy_to, "/home/deployer/sites/#{fetch(:application)}"

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
