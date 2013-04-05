require 'spec_helper'

describe User do
  fixtures :users, :tweets

  context "is taiki45" do
    subject { User.find(1) }
    let(:new_mosts) { (1..10).map { |n| {id: n, number: n} } }

    its(:id) { should eq 1 }
    its(:screen_name) { should eq 'taiki45' }
    its(:name) { should eq 'tai' }
    its(:tweets) { should_not be_nil }
    its(:tweets) { should have(2).tweet }

    context "when update with valid json" do

      it "should update successfully" do
        expect(subject.update_mosts(new_mosts.to_json)).to be_true
      end
    end

    context "when updated with valid json" do
      before do
        subject.update_mosts(new_mosts.to_json)
      end

      its(:tweets) { should have(10).tweet }

      it "should be orderd by its most number" do
        subject.update_mosts(new_mosts.shuffle.to_json)

        subject.tweets(true).each_with_index do |tweet, index|
          expect(tweet.tweet_id).to eq index + 1
          expect(tweet.most_number).to eq index + 1
        end
      end
    end

    context "when update with invalid json" do
      it "should raise Error with not 10 sized json array" do
        invalid_mosts = new_mosts[0..5].to_json
        expect { subject.update_mosts(invalid_mosts) }.to raise_error ActiveRecord::RecordInvalid
      end

      it "should raise Error with invalid json data" do
      end
    end
  end

end
