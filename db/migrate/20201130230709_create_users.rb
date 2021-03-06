class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.integer :photos_count, :default => 0
      t.integer :comments_count, :default => 0
      t.integer :likes_count, :default => 0
      t.integer :followrequests_count, :default => 0

      t.timestamps
    end
  end
end
