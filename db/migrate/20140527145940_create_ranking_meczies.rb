class CreateRankingMeczies < ActiveRecord::Migration
  def change
    create_table :ranking_meczies do |t|
      t.date :dataMeczu

      t.timestamps
    end
  end
end
