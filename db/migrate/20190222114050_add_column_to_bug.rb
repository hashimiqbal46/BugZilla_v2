class AddColumnToBug < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :title, :string
    add_column :bugs, :deadline, :date
    add_column :bugs, :bug_type, :string
    add_column :bugs, :status, :string
    add_column :bugs, :image, :string
  end
end
