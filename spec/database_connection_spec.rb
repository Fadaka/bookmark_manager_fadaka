require 'database_connection'
require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('bookmark_manager_test')
else
    DatabaseConnection.setup('bookmark_manager')
end

describe DatabaseConnection do
    describe '.setup' do
        it 'set up a connection to a database through PG ' do
            expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

            DatabaseConnection.setup('bookmark_manager_test')
        end

        it 'this connection is persistent' do
            connection = DatabaseConnection.setup('bookmark_manager_test')

            expect(DatabaseConnection.connection).to eq connection
        end
    end
end