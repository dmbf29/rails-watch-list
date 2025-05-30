class AddApiIdToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :api_id, :string
  end
end
