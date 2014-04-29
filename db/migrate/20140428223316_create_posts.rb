class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body, null: false
      t.integer :author_id, null: false

      t.timestamps
    end


    create_table :post_shares do |t|
      t.integer :circle_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end

    add_index :posts, :author_id
    add_index :post_shares, :circle_id
    add_index :post_shares, :post_id
  end
end
