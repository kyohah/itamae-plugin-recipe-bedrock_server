package 'unzip'
package 'curl'

VERSION_URL = 'https://minecraft.net/en-us/download/server/bedrock/'.freeze

bedrock_server_url =
  if node[:bedrock_server][:url]
    node[:bedrock_server][:url]
  elsif RUBY_ENGINE == 'mruby'
    run_command(%s(curl -fsSL #{VERSION_URL} | grep -o 'https:\/\/minecraft\.azureedge\.net\/bin-linux\/bedrock-server-[0-9.]\+\.zip')).stdout.chomp
  else
    require 'open-uri'
    URI.parse(VERSION_URL).read.match(%r{https://minecraft.azureedge.net/bin-linux/bedrock-server-[0-9.]+.zip}).to_s
  end

http_request 'bedrock-server.zip' do
  url bedrock_server_url
end

execute "unzip -o bedrock-server.zip -d #{node[:bedrock_server][:app_dir]}/bedrock-server"

template "#{node[:bedrock_server][:app_dir]}/bedrock-server/server.properties" do
  variables(
    configuration: node[:bedrock_server][:configuration]
  )
end
