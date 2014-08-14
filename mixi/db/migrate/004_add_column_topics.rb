class AddColumnTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :topic_id, :string
  end
  def self.down
    remove_column :topics, :topic_id
  end
end
