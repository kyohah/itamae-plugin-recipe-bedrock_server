package "unzip"
package "curl"

bedrock_server_url =
  if node[:bedrock_server][:url]
    node[:bedrock_server][:url]
  else
    run_command(%q(curl -fsSL https://minecraft.net/en-us/download/server/bedrock/ | grep -o 'https:\/\/minecraft\.azureedge\.net\/bin-linux\/bedrock-server-[0-9.]\+\.zip')).stdout.chomp
  end

http_request "bedrock-server.zip" do
  url bedrock_server_url
end

execute "unzip -o bedrock-server.zip -d #{node[:bedrock_server][:app_dir]}/bedrock-server"

template "#{node[:bedrock_server][:app_dir]}/bedrock-server/server.properties" do
  variables(
    configuration: node[:bedrock_server][:configuration]
  )
end
