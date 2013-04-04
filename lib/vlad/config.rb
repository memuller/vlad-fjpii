namespace :vlad do
  
  desc "Loads deployment configuration values."
  task :load_config do
    config = {}
    config_files.each do |file|
      data_file = file.split('.') ; data_file[data_file.size-1] = 'yml' ; data_file = data_file * '.'
      config_name = file.split('.')[file.split('.').size-2].split('/').last
      config.merge! config_name => YAML.load(File.open(data_file))
    end
    set :config, config
  end

  desc "Writes remote configuration files, based on file templates."
  remote_task :write_config => :load_config do
    config_files.each do |file|
	  if (file.split('.').size > 1) 
        key =  file.split('.')[file.split('.').size-2].split('/').last
        sample_file = file.split('.') ; sample_file = sample_file.insert(sample_file.size-1, 'sample') * '.'
      else
        sample_file = file * '.sample'      
      end
      sample_config = IO.read(sample_file)
      config[key].each do |k, v|
        sample_config.sub! '{' + k.upcase + '}', v
      end
      temp_file = Tempfile.new('config')
      temp_file.write(sample_config) and temp_file.close
      rsync temp_file.path, shared_path + '/config/' + file.split('/').last
    end
  end

end