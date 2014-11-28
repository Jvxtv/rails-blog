require_relative 'user_roles'

class User < ActiveRecord::Base
  include Clearance::User

  before_save :set_role

  validates :password, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: UserRoles.all }

  def set_role
    self.role ||= UserRoles.initial_role
  end

  def admin?
    role == UserRoles.admin
  end
end
