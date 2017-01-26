class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    new_queue = @queue.dup
    p new_queue
    new_queue
  end
end

q = Queue.new
q.show
q.enqueue(3)
q.show
q.enqueue(4)
q.show
q.dequeue
q.show
q.dequeue
q.show
