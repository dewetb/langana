require 'rails_helper'

describe 'Given worker called Kenwin with reference from user called De Wet' do
  before do
    @dewet = FactoryGirl.create(:user, first_name: 'De Wet', mobile_number: '0792951234')
    @kenwin = FactoryGirl.create(:worker, first_name: 'Kenwin', mobile_number: '0729251234')
    @review = WorkReference.create(
      work: 'IT',
      comment: 'The best IT work ever!!!',
      worker: @kenwin,
      employer_user: @dewet
    )
  end

  describe 'when users gives reviews, it lists the reviews on profile page' do
    it 'lists reviews' do
      sign_in(@dewet)

      visit worker_url(@kenwin)

      expect(page).to have_text(@review.work)
      expect(page).to have_text(@review.comment)
    end
  end
end
