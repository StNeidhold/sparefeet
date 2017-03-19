class Steward < ApplicationRecord
  # Direct associations

  has_many   :offerring_photos,
             :class_name => "SpacePhoto",
             :foreign_key => "landlord_id",
             :dependent => :destroy

  has_many   :review_of_landlords,
             :foreign_key => "landlord_id",
             :dependent => :destroy

  has_many   :review_of_renters,
             :foreign_key => "landlord_id"

  has_many   :offerrings,
             :class_name => "Space",
             :foreign_key => "landlord_id",
             :dependent => :destroy

  has_many   :rentals,
             :foreign_key => "landlord_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
