class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.text :text
      t.string :title
      t.integer :category_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
