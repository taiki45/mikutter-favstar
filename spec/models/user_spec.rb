require 'spec_helper'

describe User do
  fixtures :users, :tweets

  context "is taiki45" do
    subject { User.find(1) }

    its(:id) { should eq 1 }
    its(:screen_name) { should eq 'taiki45' }
    its(:name) { should eq 'tai' }
    its(:tweets) { should_not be_nil }
    its(:tweets) { should have(2).tweet }
  end

  context "when update" do
  end

end
