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
      User.destroy_all
    end

    it "should be able to sign in" do
      controller.sign_in(@user)
      expect(controller.signed_in?).to eq true
    end
  end
end
