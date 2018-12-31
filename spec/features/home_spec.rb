feature 'Homepage' do
  scenario 'User can send a message' do
    send_message
    expect(page).to have_content 'Hello, world'
  end

  scenario 'Has a fun gif of a bouncy ball' do
    visit '/'
    expect(page).to have_xpath("//img[@src='https://media.giphy.com/media/LpALgGQNZLzdm/giphy.gif']")
  end

  scenario 'Shows history of all messages sent this session' do
    send_message
    fill_in :message, with: 'Hello, again!'
    click_button 'Send'
    expect(page).to have_content 'Hello, world'
    expect(page).to have_content 'Hello, again!'
  end

  scenario 'displayed message has a time code' do
    send_message
    expect(page).to have_content(Time.now.strftime('%d-%m-%Y | %H:%M'))
  end

  scenario 'displays only 20 first characters of a message' do
    send_message
    expect(page).not_to have_content 'message. Banana'
  end
end
