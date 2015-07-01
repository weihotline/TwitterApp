require 'spec_helper'

describe User do
  context "authentication" do
    before do
      @email = "js@example.com"
      @password = "good-password"

      @user = User.create!(email: @email, username: "John", password: @password)
    end


    it "should fail if the user doesn't exist" do
      expect(User.find_by_credentials("fake@example.com", "faker-password")).to be_nil
    end

    it "should find existing user" do
      expect(User.find_by_credentials(@email, @password)).to_not be_nil
    end

    it "should be able to test if the password is matched" do
      expect(@user.is_password?(@password)).to eq true
    end

    it "should be able to change password" do
      @user.password = "bad-password"

      expect(@user.is_password?(@password)).to eq false
    end
  end
end
