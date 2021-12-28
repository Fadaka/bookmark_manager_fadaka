require 'pg'

class DatabaaseConnection
    def self.setup(dbname)
        PG.connect(dbname: dbname)
    end

    def self.connection
        @connection
    end
end