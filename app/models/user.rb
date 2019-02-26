class User < ApplicationRecord
  has_many :projects_users
  has_many :projects, through: :projects_users
  has_many :bugs


  accepts_nested_attributes_for :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
end
