class CreateSeens < ActiveRecord::Migration[5.2]
  def change
    create_table :seens do |t|
      t.belongs_to :user
      t.integer :userid
      t.integer :postid

      t.timestamps
    end
  end
end
