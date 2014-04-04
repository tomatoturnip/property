class Owner < ActiveRecord::Base
  has_many :buildings,
    inverse_of: :owner

  validates :first_name, presence: true
  validates :last_name, presence: true
end
