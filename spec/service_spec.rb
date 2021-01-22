describe file("/etc/default/bedrock_server") do
  let(:environment_file) do
    <<-EOS
LD_LIBRARY_PATH=#{node[:bedrock_server][:ld_library_path]}
    EOS
  end

  it { should exist }
  it { should be_file }
  it { should be_mode "644" }
  its(:content) { should eq environment_file }
end

describe file("/etc/systemd/system/bedrock_server.service") do
  it { should exist }
  it { should be_file }
  it { should be_mode "644" }
  its(:content) { should include "ExecStart=#{node[:bedrock_server][:app_dir]}/bedrock-server/bedrock_server" }
  its(:content) { should include "WorkingDirectory=#{node[:bedrock_server][:app_dir]}/bedrock-server" }
end

describe file("/etc/bedrock_server.d") do
  it { should exist }
  it { should be_directory }
end

describe service("bedrock_server") do
  it { should be_enabled }
  it { should be_running }
end
