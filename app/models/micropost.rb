class Micropost < ApplicationRecord
  belongs_to :user

  #may 26 2018
   validates :user_id, presence: true
   #may 26 2018
   validates :content, presence: true, length: { maximum: 140 }
   #may 26 2018
  default_scope -> { order(created_at: :desc) }
   #may 29 2018
  mount_uploader :picture, PictureUploader
  

#may 29 2018
    validate  :picture_size
  private
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end




end
