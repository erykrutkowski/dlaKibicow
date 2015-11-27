class CreateDruzynas < ActiveRecord::Migration
  def change
    create_table :druzynas do |t|
      t.string :nazwa
      t.string :miasto_pochodzenia
      t.string :nazwisko_trenera

      t.timestamps
    end
  end
end
