class SpacePhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :offerring,
             :class_name => "Space",
             :foreign_key => "space_id",
             :counter_cache => :offerring_photos_count

  belongs_to :landlord,
             :class_name => "Steward"

  # Indirect associations

  # Validations

end
