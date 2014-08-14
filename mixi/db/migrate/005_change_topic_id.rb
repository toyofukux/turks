class ChangeTopicId < ActiveRecord::Migration
  def self.up
    change_column :topics, :topic_id, :integer
  end
  def self.down
    change_column :topics, :topic_id, :string
  end
end
