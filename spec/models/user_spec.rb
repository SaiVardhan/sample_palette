require 'rails_helper'

RSpec.describe User, type: :model do
  
  context 'validations' do
    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_presence_of(:remote_ip) }
   end

end
