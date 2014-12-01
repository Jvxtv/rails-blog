require 'rails_helper'

describe User, type: :model do
  it 'creates a registred user' do
    user = User.new(email: 'dummy@gmail.com', password: 'pass')
    user.set_role

    expect(user.role).to eq(UserRoles.initial_role)
  end

  it 'creates a admin' do
    user = User.new(email: 'dummy@gamil.com', password: 'pass', role: UserRoles.admin)

    expect(user.role).to eq(UserRoles.admin)
  end
end
