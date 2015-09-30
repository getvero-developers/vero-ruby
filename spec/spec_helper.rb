$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__))

require 'rubygems'
require 'json'
require 'rspec'
require 'timecop'
require 'webmock/rspec'

require 'vero'