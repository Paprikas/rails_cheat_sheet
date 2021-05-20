class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :body
      t.integer :likes_count, default: 0, null: false

      t.timestamps
    end
  end
end
