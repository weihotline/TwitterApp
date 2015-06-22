class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :content, null: false
      t.integer :author_id, null: false

      t.timestamps
    end

    add_index :tweets, :author_id
  end
end
