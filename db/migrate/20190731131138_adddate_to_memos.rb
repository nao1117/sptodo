class AdddateToMemos < ActiveRecord::Migration[5.2]
  def change
    add_column :memos, :deadline, :datetime
  end
end
