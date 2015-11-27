class Pilkarz < ActiveRecord::Base
  belongs_to :druzyna
  has_many :szczegoly_wydarzenium
end
