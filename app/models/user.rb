require_relative 'user_roles'

class User < ActiveRecord::Base
  include Clearance::User

  before_save :role

  validates :password, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: UserRoles.all }

  def role
    write_attribute(:role, read_attribute(:role) || UserRoles.initial_role)
  end

  def admin?
    role == UserRoles.admin
  end
end
