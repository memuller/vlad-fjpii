namespace :vlad do
  
  desc "Installs rake, hoe, and vlad remotelly."
  remote_task :install_gems do
    run "gem install rake hoe vlad vlad-fjpii vlad-git vlad-extras"
  end

  desc "Creates config and public shared folders."
  remote_task :create_shared_folders do
    run "mkdir #{shared_path}/config/"
    run "mkdir #{shared_path}/public/"
    public_paths.each { |path| run "mkdir #{shared_path}/public/#{path.split('/').last}" }
  end


  desc "Links config files to the current revision."
  remote_task :link_config => :load_config do
    config_files.each do |file|
      run %( ln -s #{shared_path}/config/#{file.split('/').last} #{current_release}/#{file} )
    end
  end

  desc "Links public files/folders to the current revision."
  remote_task :link_public do
    public_paths.each do |file|
      run %( ln -s #{shared_path}/public/#{file.split('/').last} #{current_release}/#{file} )
    end
  end

end