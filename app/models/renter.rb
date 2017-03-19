class Renter < ApplicationRecord
  # Direct associations

  has_many   :review_of_renters,
             :dependent => :destroy

  has_many   :rentals,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
