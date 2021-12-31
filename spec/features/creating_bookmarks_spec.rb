feature 'Adding a new bookmark' do
  scenario 'user can add a book mark to the bookmark manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test bookmark')
    click_button 'Submit'

    expect(page).to have_link('Test bookmark', href: 'http://www.testbookmark.com')
  end
end
