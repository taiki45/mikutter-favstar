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

    context "when update" do
      let(:new_mosts) { (1..5).map { |n| {id: n, number: n} }.to_json }

      it "should update successfully" do
        expect(subject.update_mosts(new_mosts)).to be_true
      end
    end
  end

end
