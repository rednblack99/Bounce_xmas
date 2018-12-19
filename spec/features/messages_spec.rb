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

  context 'Seeing a message' do
    scenario 'click on a message shows the full text of the message' do
      message = Message.create(content: "A fancy message!")

      visit '/'
      click_on 'A fancy message!'
      expect(page.current_path).to eq("/messages/#{message.id}")
      expect(page).to have_content('A fancy message!')
    end
  end
end
