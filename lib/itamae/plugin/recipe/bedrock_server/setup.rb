# Check required node values
# node.validate! do
#   {
#     bedrock_server: {
#       version: string,
#     },
#   }
# end

# Set default node values
node.reverse_merge!(
  bedrock_server: {
    app_dir: "/opt",
    ld_library_path: ".",
    service_actions: [:enable, :start]
  },
)

node[:bedrock_server][:service_actions] ||= []
