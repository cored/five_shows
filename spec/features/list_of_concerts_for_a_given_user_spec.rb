require 'rails_helper' 

feature 'List five concerts for a given user based on top last.fm ratings' do 
  scenario 'Unsuccessful' do 
    visit root_path

    fill_in 'Username', with: 'anonymous' 
    click_on 'Give me!'

    expect(page).to have_css 'h2', text: "You need to start scrobbling your music preferences so we can help you out"
  end
end
