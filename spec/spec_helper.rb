$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'carrierwave'
require 'fileutils'
require 'mini_magick'
require 'carrierwave-imageoptim'

def file_path( *paths )
  File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', *paths))
end
