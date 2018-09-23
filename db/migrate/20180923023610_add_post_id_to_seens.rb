class AddPostIdToSeens < ActiveRecord::Migration[5.2]
  def change
    add_column :seens, :post_id, :integer
  end
end
