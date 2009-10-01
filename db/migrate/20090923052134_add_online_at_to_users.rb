class AddOnlineAtToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :online_at, :datetime
  end

  def self.down
    remove_column :users, :online_at
  end
end
