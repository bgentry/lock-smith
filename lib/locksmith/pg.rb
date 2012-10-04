require 'zlib'
require 'uri'
module Locksmith
  module Pg
  extend self
  BACKOFF = 0.5

    def lock(name)
      i = Zlib.crc32(name)
      result = nil
      begin
        sleep(BACKOFF) until write_lock(i)
        if block_given?
          result = yield
        end
        return result
      ensure
        release_lock(i)
      end
    end

    def write_lock(i)
      r = conn.exec("select pg_try_advisory_lock($1)", [i])
      r[0]["pg_try_advisory_lock"] == "t"
    end

    def release_lock(i)
      conn.exec("select pg_advisory_unlock($1)", [i])
    end

    def conn=(conn)
      @conn = conn
    end

    def conn
      @conn ||= PG::Connection.open(
        dburl.host,
        dburl.port || 5432,
        nil, '', #opts, tty
        dburl.path.gsub("/",""), # database name
        dburl.user,
        dburl.password
      )
    end

    def dburl
      URI.parse(ENV["DATABASE_URL"])
    end

    def log(data, &blk)
      Log.log({ns: "postgresql-lock"}.merge(data), &blk)
    end

  end
end

