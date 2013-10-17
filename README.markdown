# What is this?

Just an example app for the [join_cache gem](https://github.com/KevinBongart/join_cache).

It shows how join_cache can make `has_and_belong_to_many` and `has_many :through` associations faster using cache:

```ruby
class Assembly < ActiveRecord::Base
  has_and_belongs_to_many :parts
  include JoinCache
end

class Physician < ActiveRecord::Base
  has_many :appointments
  has_many :patients, through: :appointments
  include JoinCache
end
```
