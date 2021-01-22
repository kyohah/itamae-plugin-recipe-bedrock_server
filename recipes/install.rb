
execute "apt update"

directory "/tmp/itamae_tmp"

include_recipe 'bedrock_server'
