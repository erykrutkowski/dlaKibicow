class CreatePilkarzs < ActiveRecord::Migration
  def change
    create_table :pilkarzs do |t|
      t.string :imie
      t.string :nazwisko
      t.integer :ileGoli
      t.integer :ile_zoltych_kartek
      t.integer :ile_czerwonych
      t.references :druzyna, index: true

      t.timestamps
    end
  end
end
