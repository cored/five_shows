require 'rails_helper' 
require 'vcr_helper'

feature 'List five concerts for a given user based on top last.fm ratings' do 
  scenario 'Unsuccessful' do 
    visit root_path

    VCR.use_cassette('no-concerts-return') do 
      fill_in 'Last.fm username', with: 'dump-anonymous' 
      click_on 'Give me!'

      expect(page).to have_css 'h2', text: "You need to start scrobbling your music preferences so we can help you out"
    end
  end

  scenario 'Successfully' do 
    visit root_path

    VCR.use_cassette('list-artists-and-concerts') do 
      fill_in 'Last.fm username', with: 'cored'
      click_on 'Give me!'

      within(:css, 'ul.concerts') do 
        expect(page).to have_css 'li', text: 'No Venue'
      end
    end

  end
end
