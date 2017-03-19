class ReviewOfLandlord < ApplicationRecord
  # Direct associations

  belongs_to :rental

  belongs_to :landlord,
             :class_name => "Steward"

  belongs_to :renter,
             :counter_cache => true

  # Indirect associations

  # Validations

end
