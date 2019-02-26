class AddProjectRefToProjectsUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects_users, :project, foreign_key: true
  end
end
