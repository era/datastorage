require 'rubygems'
require 'bundler'
require 'sinatra'
require 'haml'
require 'ostruct'
require 'json'
require 'sinatra/activerecord'
require './models/attachment'
require './db/database'
require './hash'



$config = Hash.to_ostructs(YAML.load_file(File.join(Dir.pwd+'/config/', 'upload.yml')))


get '/' do
  'Welcome to the storage API'
end

get '/file/:id' do
  begin
    @file = Attachment.find(params[:id])
    send_file @file.path
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
    @upload = Attachment.new
    @upload.file = params[:file]
    @upload.save!
    @upload.to_json
  rescue RuntimeError => e
    status 500
  end
end
