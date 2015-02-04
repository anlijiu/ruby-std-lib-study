require 'forwardable'

#将  类的实例变量的record_number方法 转移到 成员变量  :records[] 上
class RecordCollection
  attr_accessor :records
  extend Forwardable
  def_delegator :@records, :[], :record_number
end

r = RecordCollection.new
r.records = [4,5,6]
p r.record_number(0)  # => 4

class RecordCollection # re-open RecordCollection class
  def_delegators :@records, :size, :<<, :map
end

r = RecordCollection.new
r.records = [1,2,3]
p r.record_number(0)   # => 1
p r.size               # => 3
p r << 4               # => [1, 2, 3, 4]
p r.map { |x| x * 2 }  # => [2, 4, 6, 8]

#==============================================================================================================

#将 my_hash.puts  转移到 STDOUT.puts
my_hash = Hash.new
my_hash.extend Forwardable              # prepare object for delegation
my_hash.def_delegator "STDOUT", "puts"  # add delegation for STDOUT.puts()
my_hash.puts "Howdy!"

#==============================================================================================================
class Queue
  extend Forwardable

  def initialize
    @q = [ ]    # prepare delegate object
  end

  # setup preferred interface, enq() and deq()...
  def_delegator :@q, :push, :enq
  def_delegator :@q, :shift, :deq

  # support some general Array methods that fit Queues well
  def_delegators :@q, :clear, :first, :push, :shift, :size
end

q = Queue.new
q.enq 1, 2, 3, 4, 5
q.push 6
p q
p q.shift    # => 1
while q.size > 0
  puts q.deq
end

p q

q.enq "Ruby", "Perl", "Python"
puts q.first
q.clear
puts q.first

#==============================================================================================================

class MyQueue
  extend Forwardable
  #attr_reader :queue
  attr_accessor :queue
  def initialize
    @queue = []
  end

  def_delegator :@queue, :push, :mypush
end
# :queue 为 attr_reader  ，所以调用  def_instance_delegators  只接受2..3个参数
q = MyQueue.new
q.mypush 42
p q.queue    #=> [42]
#q.push 23  #=> NoMethodError
