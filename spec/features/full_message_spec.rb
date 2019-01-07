feature 'Full message' do
  scenario 'Displays the full message' do
    send_message
    click_link('Hello, world. This i')
    expect(page).to have_content 'Hello, world. This is a test message. Banana'
  end

  scenario 'Only displays message clicked' do
    send_message
    fill_in :message, with: 'Minions are yellow and ugly'
    click_button 'Send'
    click_link('Minions are yellow a')
    expect(page).not_to have_content 'Hello, world.'
  end

  scenario 'Updates the message' do
    visit '/'
    fill_in :message, with: 'To be changed'
    click_button 'Send'
    click_link('To be changed')
    click_button('Edit')
    fill_in :message, with: 'I have changed'
    click_button 'Update'
    expect(page).to have_content 'I have changed'
  end

  scenario 'Deletes the message' do
    visit '/'
    fill_in :message, with: 'To be deleted'
    fill_in :tag, with: 'delete tag pls'
    click_button 'Send'
    click_link('To be deleted')
    click_button 'Delete'
    expect(page).not_to have_content 'To be deleted'
  end
end
