require 'rubygems'
require 'active_record'

class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.integer :topics
      t.string :title
      t.text :description
      t.string :comment
      t.timestamps
    end
  end
  def self.down
    drop_table :topics
  end
end

