require 'spec_helper'

describe TwitterClient do
  fixtures :users, :tweets

  context "when not initialized" do
    it "should create twitter client with oauth_tokens" do
      user = User.find(1)
      user.extend TwitterClient
      expect(user.client).not_to be_nil
    end
  end

end
