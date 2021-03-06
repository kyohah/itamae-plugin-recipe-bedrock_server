environment_file = "/etc/default/bedrock_server"

template environment_file do
  mode    "644"
  variables(environment: node[:bedrock_server][:environment])
  notifies :restart, "service[bedrock_server]"
end

template "/etc/systemd/system/bedrock_server.socket" do
  mode "644"
  notifies :restart, "service[bedrock_server]"
end

template "/etc/systemd/system/bedrock_server.service" do
  mode "644"
  variables(
    environment_file: environment_file,
    app_dir: node[:bedrock_server][:app_dir],
  )

  notifies :restart, "service[bedrock_server]"
end

directory "/etc/bedrock_server.d"

service "bedrock_server" do
  action node[:bedrock_server][:service_actions]
end
