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

    describe "its order" do
      its("first.most_number") { should eq 1 }
      its("second.most_number") { should  eq 2 }
    end
  end

end
