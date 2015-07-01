require 'spec_helper'

describe User, type: :model do
  context "Validations" do
    it "should fail validations with empty attributes" do
      user = User.new
      expect(user).to_not be_valid
      expect(user).to have(2).errors_on(:email)
      expect(user.errors.messages[:email]).to include 'can\'t be blank'
      expect(user).to have(1).error_on(:password_digest)
      expect(user.errors.messages[:password_digest]).to include 'can\'t be blank'
      expect(user).to have(1).error_on(:username)
      expect(user.errors.messages[:username]).to include 'can\'t be blank'
    end

    it "should fail validation with no username" do
      expect(User.new(email: "js@example", password: "good-password")).to have(1).error_on(:username)
    end

    it "should fail validation with no password" do
      expect(User.new(email: "js@example", username: "John")).to have(1).error_on(:password_digest)
    end

    it "should fail validation with no email" do
      expect(User.new(username: "John", password: "good-password")).to have(2).errors_on(:email)
    end

    it "should fail validation with invalid email format" do
      expect(User.new(email: "js@exam", username: "John", password: "good-password")).to have(1).error_on(:email)
    end

    it "should have a session_token" do
      expect(User.new.session_token).to_not be_nil
    end

    it "should be valid with a username, email and password" do
      expect(User.new(email: "js@example.com", username: "John", password: "good-password")).to be_valid
    end
  end
end
