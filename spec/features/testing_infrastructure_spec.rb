require_relative '../../app'

feature 'The Homepage' do
  scenario 'It says Bounce' do
    visit '/'
    expect(page).to have_content 'Welcome to Bounce'
  end
end
