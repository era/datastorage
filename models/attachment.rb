require 'securerandom'

class Attachment < ActiveRecord::Base
  validates :name, :mime_type, :path, presence: true

  def file=(upload)
    type = supported_type? upload[:type]
    self.mime_type = type['mime_type']
    self.name = SecureRandom.hex + upload[:filename]
    self.path = File.join(Dir.pwd,
            $config.file_properties.send(type['type']).absolute_path,
            self.name)

    save_file(upload)

  end

  def supported_type? type
    supported_type = $config.supported_mime_types.select { |mime_type| mime_type['mime_type'] == type }.first

    raise Application_Errors::UnsuportedFileType unless supported_type
    supported_type
  end

  def save_file(file)
    File.open(self.path, 'wb') do |f|
      f.write(file[:tempfile].read)
    end

  end

end
