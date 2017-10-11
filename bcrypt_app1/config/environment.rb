require 'bundler'
Bundler.require

configure :development do
  set :database, {
    adapter: 'postgresql',
    encoding: 'unicode',
    database: 'bcrypt_app1',
    pool: 5
  }
end

configure :production do
  set :database, {
    adapter: 'postgresql',
    encoding: 'unicode',
    database: 'bcrypt_app1',
    pool: 5
  }
end

require_all 'app'
