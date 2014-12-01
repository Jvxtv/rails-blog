require 'rails_helper'

describe User, type: :model do
  it 'creates a registred user' do
    user = FactoryGirl.create(:user)
    user.set_role

    expect(user.role).to eq(UserRoles.initial_role)
  end

  it 'creates a admin' do
    user = FactoryGirl.create(:admin)

    expect(user.role).to eq(UserRoles.admin)
  end
end
