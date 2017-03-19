class Rental < ApplicationRecord
  # Direct associations

  belongs_to :offerring,
             :class_name => "Space",
             :foreign_key => "space_id",
             :counter_cache => true

  has_one    :review_of_landlord

  has_one    :review_of_renter,
             :dependent => :destroy

  belongs_to :landlord,
             :class_name => "Steward",
             :counter_cache => true

  belongs_to :renter,
             :counter_cache => true

  # Indirect associations

  # Validations

end
