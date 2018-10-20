class CreateDisasters < ActiveRecord::Migration[5.2]
  def change
    create_table :disasters do |t|
      t.text :place
      t.datetime :time
      t.text :alert
      t.bigint :tsunami
      t.float :mag
      t.text :types
      t.text :title
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
