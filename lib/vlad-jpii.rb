%w(tempfile hoe/rake yaml).each { |lib| require lib  }
%w(vlad config setup base).each { |file| require "vlad/#{file}" }

module Vlad
  module Jpii
    VERSION = "0.0.1"
  end
end
