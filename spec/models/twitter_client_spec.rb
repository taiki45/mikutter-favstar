require 'spec_helper'

describe TwitterClient do

  subject { double("user").extend described_class }

  describe "#client" do
    it "should create twitter client with oauth_tokens" do
      subject.should_receive(:oauth_token)
      subject.should_receive(:oauth_secret)
      subject.client
    end
  end

  describe "#method_missing" do
    before { subject.instance_variable_set(:@client, double("client")) }

    subject { Object.new.extend described_class }

    it "should call client method when method missed" do
      subject.client.should_receive(:xxx).and_return("xxx")
      subject.xxx
    end
  end

end
