class CreateWydarzenies < ActiveRecord::Migration
  def change
    create_table :wydarzenies do |t|
      t.date :data_meczu
      t.string :zawodnik_nazwisko
      t.integer :w_ktorej_minucie_gol
      t.string :czerwona_kartka
      t.string :zolta_kartka_string
      t.references :pilkarz, index: true
      t.references :mecz, index: true

      t.timestamps
    end
  end
end
