desc "Full setup routines"
task :setup => %w(vlad:setup vlad:install_gems vlad:create_shared_folders vlad:write_config vlad:update)

desc "Updates codebase"
task :update => %w(vlad:update)