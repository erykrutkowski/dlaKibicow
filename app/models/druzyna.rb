class Druzyna < ActiveRecord::Base
  has_many :pilkarz
  belongs_to :mecz
end
