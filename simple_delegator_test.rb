require 'delegate'
require 'date'

class User
  def born_on
    Date.new(1989, 9, 10)
  end
end

class UserDecorator < SimpleDelegator
  def birth_year
    born_on.year
  end
end

decorated_user = UserDecorator.new(User.new)
p decorated_user.birth_year  #=> 1989
p decorated_user.__getobj__  #=> #<User: ...>


#==================================================================
print "==================================================================\n\n"

class Stats
  def initialize
    @source = SimpleDelegator.new([])
  end

  def stats(records)
    @source.__setobj__(records)

    "Elements:  #{@source.size}\n" +
      " Non-Nil:  #{@source.compact.size}\n" +
      "  Unique:  #{@source.uniq.size}\n"
  end
end

s = Stats.new
puts s.stats(%w{James Edward Gray II})
puts
puts s.stats([1, 2, 3, nil, 4, 5, 1, 2])


#==================================================================
print "==================================================================\n\n"

names = SimpleDelegator.new(%w{James Edward Gray II})
puts names[1]    # => Edward
names.__setobj__(%w{Gavin Sinclair})
puts names[1]    # => Sinclair
