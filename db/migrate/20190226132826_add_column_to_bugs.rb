class AddColumnToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :Assigned, :integer
  end
end
