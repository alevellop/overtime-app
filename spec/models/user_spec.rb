require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: "test@test.com", password: "12345678", password_confirmation: "12345678", first_name: "Jon", last_name:"Snow")
    end

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_nam, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe "custom name methods" do
    it "has a full name method that combines first and last name" do
      expect(@user.full_name).to eq("Snow, Jon")
    end
  end
end
