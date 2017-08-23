class CreatePullRequest < ActiveRecord::Migration[5.1]
  def change
    create_table :pull_requests do |t|
      t.string :number, null: false
      t.string :html_url, null: false
      t.string :state, null: false
      t.text :title
      t.datetime :pr_created_at
      t.datetime :pr_closed_at
      t.datetime :pr_merged_at
      t.timestamps
    end
  end
end
