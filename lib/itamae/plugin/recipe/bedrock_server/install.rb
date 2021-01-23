require 'open-uri'

package "unzip"
package "curl"

bedrock_server_url = node[:bedrock_server][:url] || URI.open("https://minecraft.net/en-us/download/server/bedrock/").read.match(/https:\/\/minecraft\.azureedge\.net\/bin-linux\/bedrock-server-[.0-9]*\.zip/).to_s

http_request "bedrock-server.zip" do
  url bedrock_server_url
end

execute "unzip -o bedrock-server.zip -d #{node[:bedrock_server][:app_dir]}/bedrock-server"

template "#{node[:bedrock_server][:app_dir]}/bedrock-server/server.properties" do
  variables(
    configuration: node[:bedrock_server][:configuration]
  )
end
