
class Politician < ActiveRecord::Base
  belongs_to :state
  belongs_to :party
  belongs_to :title

end