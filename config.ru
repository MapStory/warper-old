require File.expand_path(File.dirname(__FILE__) + '/config/environment')

use Rails::Rack::LogTailer
use Rails::Rack::Static
run ActionController::Dispatcher.new