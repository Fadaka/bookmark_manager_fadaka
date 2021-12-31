feature 'Updating a bookmark' do
    scenario 'A user can update a bookmark' do
        bookmark = Bookmark.create(url: 'https://en-gb.facebook.com/', title:'facebook')
        visit('/bookmarks')
        expect(page).to have_link('facebook', href: 'https://en-gb.facebook.com/')

        first('.bookmark').click_button 'Edit'
        expect(current_path). to eq "/bookmarks/#{bookmark.id}/edit"

        fill_in('url', with: "http://www.snakersacademy.com")
        fill_in('title', with: "Snakers Academy")
        click_button('Submit')

        expect(current_path).to eq '/bookmarks'
        expect(page).not_to have_link('facebook',href: 'https://en-gb.facebook.com/')
        expect(page).to have_link('Snakers Academy', href: 'http://www.snakersacademy.com')
    end
end