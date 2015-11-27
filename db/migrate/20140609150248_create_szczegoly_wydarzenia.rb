class CreateSzczegolyWydarzenia < ActiveRecord::Migration
  def change
    create_table :szczegoly_wydarzenia do |t|
      t.date :data_wydarzenia
      t.integer :ile_goli
      t.integer :czerwone_kartki
      t.integer :zolte_kartki
      t.references :pilkarz, index: true
      t.references :mecz, index: true

      t.timestamps
    end
  end
end
