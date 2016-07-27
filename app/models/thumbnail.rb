class Thumbnail < ApplicationRecord
  has_attached_file :image,
                    styles: { thumb: ["50x50#", :jpg] },
                    storage: :s3,
                    bucket: ENV["S3_BUCKET"],
                    s3_credentials: {access_key_id: ENV["AWS_KEY"], secret_access_key: ENV["AWS_SECRET"]}
  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  belongs_to :user
end
