
class Politician < ActiveRecord::Base
  validates :firstname, presence: true
  validates :lastname, presence: true


  belongs_to :state
  belongs_to :party
  belongs_to :title

end