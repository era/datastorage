class Attachment < ActiveRecord::Base
  validates :name, :type, :path, presence: true

  def file=(upload)

  end

end
