class ReviewOfRenter < ApplicationRecord
  # Direct associations

  belongs_to :renter,
             :counter_cache => true

  # Indirect associations

  # Validations

end
