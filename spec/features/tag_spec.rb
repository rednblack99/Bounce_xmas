feature 'User can tag message' do
  scenario 'User can enter tag on homepage' do
  visit '/'
  expect(page).to have_field "tag"
  end
end