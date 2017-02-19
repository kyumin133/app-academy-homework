require 'spec_helper'

describe User do
  subject(:user) do
    FactoryGirl.build(:user,
      username: "jonathan",
      password: "good_password")
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:posts) }
  it { should have_many(:comments) }

  describe "#is_password?" do
    it "does not accept incorrect password" do
      expect(user.is_password?("123456")).to be false
    end

    it "accepts correct password" do
      expect(user.is_password?("good_password")).to be true
    end
  end

  describe "#reset_session_token" do
    it "returns a new session token" do
      old_token = user.session_token
      expect(user.reset_session_token!).to_not eq old_token
    end
  end

  describe "::find_by_credentials" do
    it "finds a user by username and password" do
      user.save
      expect(User.find_by_credentials(user.username, user.password).id).to eq user.id
      user.destroy
    end

    it "return nil if no one is found" do
      expect(User.find_by_credentials(user.username, "123456")).to be nil
    end
  end
end
