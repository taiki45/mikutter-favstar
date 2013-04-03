require 'spec_helper'

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
