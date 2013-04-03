require 'spec_helper'

describe User do
  fixtures :users, :tweets

  context "is taiki45" do
    subject { User.find(1) }

    its(:id) { should eq 1 }
    its(:screen_name) { should eq 'taiki45' }
    its(:name) { should eq 'tai' }
    its(:tweets) { should_not be_nil }
  end

end


describe Tweet do
  fixtures :users, :tweets

  context "belongs to taiki45" do
    subject { User.find(1).tweets }

    it { should have(2).items }
    it "is ordered by most number" do
      expect(subject.first.most_number).to eq 1
      expect(subject.second.most_number).to eq 2
    end
  end
end
