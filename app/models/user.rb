class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :user, :name, :string
    add_column :user, :apellido, :string
    add_column :user, :nick, :string
    add_column :user, :telefono, :string
    add_column :user, :photo, :string
  end
end
