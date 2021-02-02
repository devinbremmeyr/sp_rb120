# Circular Queue:
# A collection of objects stored in a buffer that is treated as though it is
# connected end-to-end in a circle.

# When an object is added to this circular queue,
# it is added to the position that immediately follows the most recently added
# object.

# Removing an object
# always removes the object that has been in the queue the longest.

# This works as long as there are empty spots in the buffer.

# If the buffer becomes full, adding a new object to the queue 
# requires getting rid of an  existing object.

# With a circular queue, the object that has been in the queue
# the longest is discarded and replaced by the new object.

# APPROACH:
# [] .dequeue    => [] => nil
# [] .enqueue(1) => [1]
# [] .enqueue[2] => [1,2]
# [] .dequeue    => [2] => 1

class CircularQueue
  def initialize(max_size)
    @buffer = Array.new
    @max_size = max_size
  end

  def dequeue
    @buffer.shift
  end

  def enqueue(obj)
    dequeue if @buffer.size == @max_size
    @buffer << obj
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
