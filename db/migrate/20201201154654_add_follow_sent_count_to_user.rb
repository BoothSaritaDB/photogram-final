class AddFollowSentCountToUser < ActiveRecord::Migration[6.0]
  def change

    add_column :users, :followsent_count, :integer
  end
end
