require 'rubygems'
require 'bundler'
require 'sinatra'
require 'haml'
require 'sinatra/activerecord'
require './models/attachment'
require './db/database'


get '/' do
  'Welcome to the storage API'
end

get '/file/:id' do
  begin
    @file = Attachment.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    status 404
  end
end
=begin
 {
 file => {
    :type => "image/png",
    :head =>  "Content-Disposition: form-data;
               name=\"myfile\";
               filename=\"cat.png\"\r\n
               Content-Type: image/png\r\n",
    :name => "myfile",
    :tempfile => #<File:/var/folders/3n/3asd/-Tmp-/RackMultipart201-1476-nfw2-0>,
    :filename=>"cat.png"
  }
}
=end
post '/file' do
  begin
    
  rescue RuntimeError => e
    status 500
  end
end
