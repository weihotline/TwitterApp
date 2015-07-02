require 'rails_helper'

describe UsersController, type: :controller do
  controller do
  end

  context "Before logged in" do
    it "should not be signed in" do
      expect(controller.signed_in?).to eq false
    end
  end

  context "After logged in" do
    before(:all) do
      @user = User.create!(email: "jc@example.com", username: "John", password: "good-password")
    end

    after(:all) do
      User.last.destroy
    end

    it "should be able to sign in" do
      controller.sign_in(@user)
      expect(controller.signed_in?).to eq true
    end

    it "should have the current_user to be the same as the user who just singed in" do
      controller.sign_in(@user)
      expect(@user).to eq(controller.current_user)
    end

    it "should be able to sign out" do
      controller.sign_in(@user)
      controller.sign_out
      expect(controller.signed_in?).to eq false
    end
  end
end
