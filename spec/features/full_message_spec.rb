# frozen_string_literal: true

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
end
