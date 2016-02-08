class Image < ActiveRecord::Base

  # Attachment
  has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }

  # Validations
  validates_attachment_content_type :img,
                                    :content_type => ['image/png', 'image/jpg', 'image/jpeg', 'image/gif'],
                                    :message => "must be .png, .jpg or .jpeg or .gif files"

  # Associations
  belongs_to :product
end
