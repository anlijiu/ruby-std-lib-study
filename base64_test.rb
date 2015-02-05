#!/usr/bin/env ruby

require 'base64'
str = 'VGhpcyBpcyBsaW5lIG9uZQpUaGlzIG' +
        'lzIGxpbmUgdHdvClRoaXMgaXMgbGlu' +
              'ZSB0aHJlZQpBbmQgc28gb24uLi4K'
puts Base64.decode64(str)



enc   = Base64.encode64('Send reinforcements')      # -> "U2VuZCByZWluZm9yY2VtZW50cw==\n"
plain = Base64.decode64(enc)                        # -> "Send reinforcements"
bin   = Base64.encode64("Now is the time for all good coders\nto learn Ruby")
p enc 
p plain
p bin

