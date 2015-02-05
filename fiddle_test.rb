#!/usr/bin/env ruby

require 'fiddle'

module SymbolToFiddleType
  def symbol_to_fiddle_type(sym)
    return sym unless sym.kind_of? Symbol

    case sym
    when nil, :non, :none, :v, :void then Fiddle::TYPE_VOID
    when :c, :char   then Fiddle::TYPE_CHAR
    when :i, :int    then Fiddle::TYPE_INT
    when :l, :long   then Fiddle::TYPE_LONG
    when :short      then Fiddle::TYPE_SHORT
    when :s, :string then Fiddle::TYPE_VOIDP
    end
  end
end

libc_so = "/lib/x86_64-linux-gnu/libc-2.19.so"
@handle = Fiddle::Handle.new(libc_so, Fiddle::RTLD_LAZY | Fiddle::RTLD_GLOBAL)
#=> #<Fiddle::Handle:0x00000000d69ef8>
strcpy_addr = @handle.sym('strcpy')
p strcpy_addr
p s1 = "  "
p s2 = "cc"

Fiddle::Function.new(strcpy_addr, 
                     [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP],
                     Fiddle::TYPE_VOID ).call(s1, s2)

p s1
p s2

module OfFiddle
  include SymbolToFiddleType

  def library(name)
    @lib = Fiddle::Handle.new(name.to_s)
  end

  def declare(name, arg_types = [], ret_type = :none)
    #p arg_types.map { |v| symbol_to_fiddle_type(v) }
    #p symbol_to_fiddle_type(ret_type)

    Fiddle::Function.new(
      func_addr(name.to_s),
      arg_types.map { |v| symbol_to_fiddle_type(v) },
      symbol_to_fiddle_type(ret_type)
    )
  end

  private
  def func_addr(name)
    @lib.sym(name)
  end
end

class Foo
  include  OfFiddle
end
s1 = "   "
s2 = "cc"
p "==========================="
f = Foo.new
f.library(libc_so)
func = f.declare("strcpy", [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP], Fiddle::TYPE_VOID)
func.call(s1, s2)
p s1
p s2
