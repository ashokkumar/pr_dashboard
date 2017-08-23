class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :pull_request, index: true, foreign_key: true
      t.string :state, null: false
      t.string :user
      t.datetime :submitted_at
      t.text :body
    end
  end
end
