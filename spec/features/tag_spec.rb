feature 'User can tag message' do
  scenario 'User can enter tag on homepage' do
  visit '/'
  expect(page).to have_field "tag"
  end
scenario 'tag displays alongside full message' do
  visit '/'
  fill_in :message, with: 'Tag test!'
  fill_in :tag, with: 'new tag'
  click_button 'Send'
  expect(page).to have_content 'new tag'
  end

end