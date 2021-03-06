class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.references :forum
      t.references :user
      t.string :subject
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
