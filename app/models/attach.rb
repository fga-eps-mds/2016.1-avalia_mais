class Attach < ActiveRecord::Base
	belongs_to :user
	belongs_to :company

	has_attached_file :photo
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
    validates_attachment_file_name :photo, matches: /jpe?g\Z/
    validates_with AttachmentSizeValidator, attributes: :photo, less_than: 1.megabytes
    validates_attachment :photo, content_type: { content_type: "image/jpeg" }
end
