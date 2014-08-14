class AddColumnTopicsIsSuspended < ActiveRecord::Migration
  def self.up
    add_column :topics, :is_suspended, "CHAR(1)"
  end
  def self.down
    remove_column :topics, :is_suspended
  end
end
