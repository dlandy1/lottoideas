class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :post_id
      t.string :address

      t.timestamps null: false
    end
    add_index :votes, :post_id
  end
end
