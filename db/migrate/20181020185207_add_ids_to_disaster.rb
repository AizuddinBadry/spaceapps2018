class AddIdsToDisaster < ActiveRecord::Migration[5.2]
  def change
    add_column :disasters, :ids, :text
  end
end
