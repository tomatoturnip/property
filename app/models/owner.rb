class Owner < ActiveRecord::Base
  has_many :buildings, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
end
