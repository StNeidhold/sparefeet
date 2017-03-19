class SpacePhoto < ApplicationRecord
  # Direct associations

  belongs_to :landlord,
             :class_name => "Steward"

  # Indirect associations

  # Validations

end
