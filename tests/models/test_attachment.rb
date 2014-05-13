require 'minitest/autorun'
require 'sinatra/activerecord'


require '../../hash'
require '../config/env'
require '../../models/attachment'
require '../../exceptions/application_errors'

class TestAttachment < MiniTest::Unit::TestCase

  def test_invalid_type
    assert_raises Application_Errors::UnsuportedFileType do
      upload = Attachment.new
      upload.supported_type?'php/application'
    end
  end

  def test_valid_type
      upload = Attachment.new
      upload.supported_type?'image/jpeg'
  end

end
