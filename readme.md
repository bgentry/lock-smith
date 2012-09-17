# Locksmith

**This software is beta quality. Check back later to hear battle testing results**

A library of locking algorithms for a variety of data stores. Supported Data Stores:

* DynamoDB
* PostgreSQL
* TODO: Doozerd
* TODO: Zookeeper

## Usage

There is only 1 public method:

```
lock(name, &blk)
```

Install using the gem. The gem does not depend on the data store drivers, you will need to install those for yourself.

```
$ gem install pg
$ gem install lock-smith
```

### DynamoDB

Create a DynamoDB table named **Locks** with a hash key **Name**.

```ruby
ENV["AWS_ID"] = "id"
ENV["AWS_SECRET"] = "secret"

require 'aws/dynamo_db'
require 'locksmith/dynamodb'
Locksmith::Dynamodb.lock("my-resource") do
  puts("locked my-resource with DynamoDB")
end
```

### PostgreSQL

Locksmith will use `pg_try_advisory_lock` to lock, no need for table creation.

```ruby
ENV["DATABASE_URL"] = "postgresql://user:pass@localhost/database_name"

require 'pg'
require 'locksmith/pg'
Locksmith::Pg.lock("my-resource") do
  puts("locked my-resource with PostgreSQL")
end
```

## Why Locksmith

Locking code is tricky. Ideally, I would write it once, verify in production for
a year then never think about it again.

## Hacking on Locksmith

There are still some Data Stores to implement, follow the pattern for PostgreSQLand DynamoDB and submit a pull request.

## Contributors

* Ryan Smith
* Blake Gentry

## License

Copyright (C) 2012 Ryan Smith

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
