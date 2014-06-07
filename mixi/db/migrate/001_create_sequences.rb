require 'rubygems'
require 'active_record'

class CreateSequences < ActiveRecord::Migration
  def self.up
    create_table :sequences do |t|
      t.integer :community
      t.integer :topics
      t.timestamps
    end
  end
  def self.down
    drop_table :sequences
  end
end

