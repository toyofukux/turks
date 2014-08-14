class ChangeColumnTopicsIsSuspended < ActiveRecord::Migration
  def self.up
    change_column :topics, :is_suspended, "CHAR(1)", default: "0"
  end
  def self.down
    change_column :topics, :is_suspended, "CHAR(1)"
  end
end
