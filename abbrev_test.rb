require 'abbrev'
require 'pp'

#缩写
# car 与 cone 有同样的开头c  所以缩写中没有c
p "#{Abbrev.abbrev(%w{ car cone })}"
#=> {"ca"=>"car", "con"=>"cone", "co"=>"cone", "car"=>"car", "cone"=>"cone"}
#
p %w{ car cone }.abbrev

p "#{Abbrev.abbrev(%w{car box cone})}"
#b 为 box 缩写
