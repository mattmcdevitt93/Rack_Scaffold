require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])
#if ENV['RACK_ENV'] == 'staging'
    # use Rack::Auth::Basic, "Please Sign In" do |username, password|
    #   [username, password] == ['ENV["USERNAME"]', 'ENV["PASSWORD"]'] # Change the values to whatever you want
    # end
#end
use Rack::StaticCache, :urls => ['/assets', '/css', '/js', '/lib'], :root => 'public'

use Rack::Rewrite do
  rewrite '/', '/index.html'
  rewrite '/test', '/Test_Page.html'
end

run Rack::Directory.new('public')