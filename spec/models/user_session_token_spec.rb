require 'spec_helper'

describe User do
  context "Session Token" do
    it "::generate_session_token (small chance this will fail)" do
      expect(User.generate_session_token).to_not eq(User.generate_session_token)
    end

    it "#reset_session_token!" do
      user = User.new(email: "js@example.com", username: "John", password: "good-password")
      session_token = user.session_token

      expect(user.reset_session_token!).to_not eq(session_token)
    end
  end
end
