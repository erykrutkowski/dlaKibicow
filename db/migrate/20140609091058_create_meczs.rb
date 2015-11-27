class CreateMeczs < ActiveRecord::Migration
  def change
    create_table :meczs do |t|
      t.references :gospodarz, index: true
      t.references :gosc, index: true
      t.integer :punkty_gospodarzy
      t.integer :punkty_gosci
      
      t.timestamps
    end
  end
end
