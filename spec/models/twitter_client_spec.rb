require 'spec_helper'

describe TwitterClient do

  let(:user) do
    user = double("user")
    user.extend described_class
  end

  context "when not initialized" do
    it "should create twitter client with oauth_tokens" do
      user.should_receive(:oauth_token)
      user.should_receive(:oauth_secret)
      user.client
    end
  end

end
