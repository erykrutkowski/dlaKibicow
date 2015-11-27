class CreatePrzebiegMeczus < ActiveRecord::Migration
  def change
    create_table :przebieg_meczus do |t|
      t.date :data_meczu
      t.string :miejsce_meczu
      t.string :druzyna
      t.integer :w_ktorej_minucie_gol
      t.integer :wynik_meczu
      t.references :rankingMeczy, index: true

      t.timestamps
    end
  end
end
