require 'rubygems'
require 'active_record'

class CreateSequence < ActiveRecord::Migration
  def self.up
    create_table :sequence do |t|
      t.integer :community
      t.integer :topics
      t.timestamps
    end
  end
  def self.down
    drop_table :sequence
  end
end

