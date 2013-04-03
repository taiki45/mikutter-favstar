require 'spec_helper'

describe TwitterClient do
  fixtures :users, :tweets

  let(:user) do
    user = User.find(1)
    user.extend described_class
  end

  context "when not initialized" do
    it "should create twitter client with oauth_tokens" do
      expect(user.client).not_to be_nil
    end
  end

end
