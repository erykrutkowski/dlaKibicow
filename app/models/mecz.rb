class Mecz < ActiveRecord::Base
  belongs_to :szczegoly_wydarzenium
  belongs_to :gospodarz, :class_name => 'Druzyna'
  belongs_to :gosc, :class_name => 'Druzyna'
end
