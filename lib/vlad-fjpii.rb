%w(vlad tempfile hoe/rake yaml).each { |lib| require lib  }
%w(config setup base version).each { |file| require File.dirname(__FILE__) + "/vlad/#{file}.rb" }
