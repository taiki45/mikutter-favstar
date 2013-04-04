require 'spec_helper'

describe User do
  fixtures :users, :tweets

  context "is taiki45" do
    subject { User.find(1) }
    let(:new_mosts) { (1..5).map { |n| {id: n, number: n} }.to_json }

    its(:id) { should eq 1 }
    its(:screen_name) { should eq 'taiki45' }
    its(:name) { should eq 'tai' }
    its(:tweets) { should_not be_nil }
    its(:tweets) { should have(2).tweet }

    context "when update with valid json" do

      it "should update successfully" do
        expect(subject.update_mosts(new_mosts)).to be_true
      end
    end

    context "when updated with valid json" do
      before do
        subject.update_mosts(new_mosts)
      end

      its(:tweets) { should have(5).tweet }

      it "should be orderd by its most number" do
        subject.update_mosts(JSON.parse(new_mosts).shuffle.to_json)

        subject.tweets(true).each_with_index do |tweet, index|
          expect(tweet.tweet_id).to eq index + 1
          expect(tweet.most_number).to eq index + 1
        end
      end
    end
  end

end
