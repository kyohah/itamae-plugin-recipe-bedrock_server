describe file("#{node[:bedrock_server][:app_dir]}/bedrock-server/bedrock_server") do
  it { should exist }
  it { should be_file }
  it { should be_executable }
end
