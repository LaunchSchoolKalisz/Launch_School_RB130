class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title && 
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title, :todos
  
  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class == Todo
      todos.push todo
      todos
    else
      raise TypeError.new("Can only add Todo objects")
    end
  end

  def <<(todo)
    add(todo)
  end

  def size
    todos.size
  end

  def first
    todos[0]
  end

  def last 
    todos[-1]
  end

  def to_a
    todos
  end

  def done?
    return true if todos.all? {|todo| todo.done?}
    false
  end

  def item_at(idx)
    if (0...todos.size).to_a.include?(idx)
      todos[idx]
    else
      raise IndexError
    end
  end

  def mark_done_at(idx)
    item = item_at(idx)
    item.done!
  end

  def mark_undone_at(idx)
    item = item_at(idx)
    item.undone!
  end

  def done!
    (0...todos.size).to_a.each {|num| mark_done_at(num)}
  end

  def shift
    todos.shift
  end
  
  def pop
    todos.pop
  end

  def remove_at(idx)
    item = item_at(idx)
    todos.delete_at(idx)
    item
  end

  def to_s
    text = <<~HEREDOC
    "---- #{title} ----" 
    HEREDOC


    todos.each do |item| 
      text << item.to_s
      text << "\n"
    end
    text
  end

  def each
    counter = 0
    while counter < size
      yield(item_at(counter))
      counter +=1
    end
  end

  def select
    new_ary = []
    counter = 0

    while counter < size
      current_item = item_at(counter)
      new_ary << current_item if yield(current_item) == true
      counter += 1
    end
    new_ary
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect