class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.timestamps
    end
    add_index :circles, :user_id

    create_table :circle_memberships do |t|
      t.integer :user_id, null: false
      t.integer :circle_id, null: false
      t.timestamps
    end
    add_index :circle_memberships, :user_id
    add_index :circle_memberships, :circle_id
  end
end
