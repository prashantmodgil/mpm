require 'rails_helper'
RSpec.describe Account, type: :model do
   it { is_expected.to validate_presence_of(:name) }
   it { is_expected.to validate_presence_of(:user_id) }
   it "The owner_of_account method should return an Array" do
    account = Account.where(user_id: 1)
    expect(account).to be_an_instance_of(Array)
    
      end
end
