class Wydarzenie < ActiveRecord::Base
  belongs_to :pilkarz
  belongs_to :mecz
end
