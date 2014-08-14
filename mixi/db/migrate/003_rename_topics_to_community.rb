class RenameTopicsToCommunity < ActiveRecord::Migration
  def self.up
    rename_column :topics, :topics, :community_id
  end
  def self.down
    rename_column :topics, :community_id, :topics
  end
end
