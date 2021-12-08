require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.create( 'http://www.makersacademy.com', 'Makers Academy')
      Bookmark.create('http://www.destroyallsoftware.com', 'Destroy All Software')
      Bookmark.create('http://www.google.com', 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com - Makers Academy")
      expect(bookmarks).to include("http://www.destroyallsoftware.com - Destroy All Software")
      expect(bookmarks).to include("http://www.google.com - Google")
    end
    it 'can add bookmarks to the database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create('www.example.com','example')
      bookmarks = Bookmark.all
      expect(bookmarks).to include('www.example.com - example')
    end
  end
end