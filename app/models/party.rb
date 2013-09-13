

class Party < ActiveRecord::Base
  validates :name, presence: true
  has_many :politicians
end