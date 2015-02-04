require 'digest'




p Digest::SHA256.file("simple_delegator_test.rb").hexdigest

p Digest::SHA256.hexdigest("ruby");   # => "b9138194ffe9e7c8bb6d79d1ed56259553d18d9cb60b66e3ba5aa2e5b078055a"

d = Digest::SHA256.new
d.update("ruby")
p d.hexdigest                         # => "b9138194ffe9e7c8bb6d79d1ed56259553d18d9cb60b66e3ba5aa2e5b078055a"

require 'digest/md5'
p Digest::MD5.hexdigest("ruby") # => "58e53d1324eef6265fdb97b08ed9aadf"


p Digest::MD5.hexdigest('abc')               #=> '900150983cd24fb0d6963f7d28e17f72'
p Digest::MD5.file('simple_delegator_test.rb').to_s #=> '3fbb02294a8ca33d4684055adba5ed6f'

digest = Digest::MD5.new
digest.update("ruby")
p digest.digest # => "X\345=\023$\356\366&_\333\227\260\216\331\252\337"
p digest.hexdigest  # => "58e53d1324eef6265fdb97b08ed9aadf"

p digest.digest! # => "X\345=\023$\356\366&_\333\227\260\216\331\252\337"
p digest.digest! # => "\324\035\214\331\217\000\262\004\351\200\t\230\354\370B~"
p digest.digest! # => "\324\035\214\331\217\000\262\004\351\200\t\230\354\370B~"

#require 'debug'

for a in ["MD5", "SHA1", "SHA512", "SHA256"]
  digest = Digest(a).new
  p digest.block_length # => 64, 128, 128, 128
end


#m.update(a); m.update(b) 
#m.update(a + b); m << a << b;  m << a + b  相等!!!!!!!!!!!!!!!!!!!!!!
#update 是追加.....为什么...... 这不科学阿...
digest = Digest::MD5.new
digest.update("r")
digest.update("u")
digest.update("b")
digest.update("y")
p digest.hexdigest # => "58e53d1324eef6265fdb97b08ed9aadf"

digest = Digest::MD5.new
digest << "r"
digest << "u"
digest << "b"
digest << "y"
p digest.hexdigest # => "58e53d1324eef6265fdb97b08ed9aadf"
