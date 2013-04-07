require 'spec_helper'

describe Tweet do
  fixtures :users, :tweets

  context "when create new" do
    context "with invalid data" do
      subject { Tweet.create(tweet_id: 100) }

      it { should be_invalid }
      its(:errors) { should have(1).error }
      its(:errors) { should have_key :most_number }

      it "should raise ActiveRecord::RecordInvalid on create!" do
        expect { Tweet.create!(tweet_id: 10) }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end

  context "belongs to taiki45" do
    subject { User.find(1).tweets }

    it { should have(10).items }

    describe "its order" do
      its("first.most_number") { should eq 1 }
      its("second.most_number") { should  eq 2 }
    end
  end

end
