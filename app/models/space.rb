class Space < ApplicationRecord
  # Direct associations

  has_many   :offerring_photos,
             :class_name => "SpacePhoto",
             :dependent => :destroy

  has_many   :rentals

  belongs_to :landlord,
             :class_name => "Steward"

  # Indirect associations

  # Validations

end
