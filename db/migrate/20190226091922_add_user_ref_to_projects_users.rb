class AddUserRefToProjectsUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects_users, :user, foreign_key: true
  end
end
