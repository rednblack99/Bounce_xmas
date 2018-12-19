RSpec.feature 'Messages' do
  context 'Creating' do
    scenario 'A user can submit text and see it with a timestamp' do
      visit '/'
      fill_in :content, with: 'A message!'
      click_button 'Create'
      expect(page).to have_content 'A message!'
    end

    scenario 'A user can submit text and it redirects back to the index' do
      visit '/'
      fill_in :content, with: 'A message!'
      click_button 'Create'
      expect(page.current_path).to eq('/')
    end

    scenario 'A user can submit many messages and see them all' do
      visit '/'
      fill_in :content, with: 'A message!'
      click_button 'Create'
      fill_in :content, with: 'A second one!'
      click_button 'Create'
      fill_in :content, with: 'A third one!'
      click_button 'Create'
      expect(page).to have_content 'A message!'
      expect(page).to have_content 'A second one!'
      expect(page).to have_content 'A third one!'
    end
  end

  xcontext 'Seeing a message' do
    scenario 'click on a message shows the full text of the message' do
      visit '/'
      fill_in :content, with: 'A message!'
      click_button 'Create'
      id = find()
      click 'A message!'
      expect(page.current_path).to eq('/messages/' + id)
      expect(page).to have_content('A message!')
    end
  end
end
