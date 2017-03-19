class Rental < ApplicationRecord
  # Direct associations

  belongs_to :landlord,
             :class_name => "Steward",
             :counter_cache => true

  belongs_to :renter,
             :counter_cache => true

  # Indirect associations

  # Validations

end
