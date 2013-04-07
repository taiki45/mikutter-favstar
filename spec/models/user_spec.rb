require 'spec_helper'

describe User do

  fixtures :users, :tweets

  context "when create new" do
    let :valid do
      {
        twitter_id: 5,
        screen_name: 'user5',
        name: 'user 5',
        profile_image_url: 'http://example.com/image.png',
        oauth_token: 'A',
        oauth_secret: 'B'
      }
    end

    context "given valid data" do
      subject { User.new(valid) }
      it { should be_valid }
    end

    context "given invalid data" do

      context "when create duplicatedlly" do
        before { valid_user = User.create(valid) }

        subject { duplicated_user = User.create(valid) }
        it { should be_invalid }
        its(:errors) { should have(4).error }
        %w(twitter_id screen_name oauth_token oauth_secret).map(&:to_sym).each do |key|
          its(:errors) { should have_key key }
        end

        it "should not raise on create" do
          create_duplicated = -> { User.create(valid) }
          expect(create_duplicated).not_to raise_error
        end

        it "should raise ActiveRecord::RecordInvalid on create!" do
          create_duplicated = -> { User.create!(valid) }
          expect(create_duplicated).to raise_error ActiveRecord::RecordInvalid
        end
      end

    end
  end


  context "when is taiki45" do
    subject { User.find(1) }
    let(:new_mosts) { (1..10).map { |n| { 'id' => n, 'number' => n } } }

    context "when have no tweet" do
      subject { User.find(1) }

      its(:id) { should eq 1 }
      its(:screen_name) { should eq 'taiki45' }
      its(:name) { should eq 'tai' }
      its(:tweets) { should have(10).tweet }
    end

    context "when update with valid json" do

      it "should update successfully" do
        expect(subject.update_mosts(new_mosts.to_json)).to be_true
      end
    end

    context "when updated with valid json" do
      before do
        subject.update_mosts(new_mosts.to_json)
      end

      it { should be_valid }
      it { should_not be_invalid }
      its(:errors) { should be_empty }
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
        result = subject.update_mosts(invalid_mosts)

        expect(result).to be_false

        expect(subject.errors).to have_key(:tweets_size)
        expect(subject.errors).to have(1).error

        expect(subject.tweets).to have(0).tweets
        expect(subject.tweets(true)).to have(0).tweets
        expect(subject).to be_invalid
      end

      it "should raise Error with invalid json data" do
        invalid_mosts = new_mosts.to_json[0..5]
        result = subject.update_mosts(invalid_mosts)

        expect(result).to be_false
        expect(subject.errors).to have(1).error
        expect(subject.errors).to have_key :parse_error
      end
    end
  end

end
