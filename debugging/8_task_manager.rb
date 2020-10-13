class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    high_priority_tasks = tasks.select do |task|
      task.priority == :high
    end

    display(high_priority_tasks)
  end

  private

  def display(task_arr)
    puts "--------"
    task_arr.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks # => from line 35 #display_high_priority_tasks
# => private method 'select' called for nil:NilClass (NoMethodError)


# => from line 35 in TaskManager#display_high_priority_tasks 
# => tasks = tasks.select # @tasks is an array => Array#select intended

# perhaps what is happening is @tasks has been assigned to nil
# or
# @tasks was not initialized (not likely as #display_all_tasks works)

# In fact the issue was a name collision in #display_high_priority_tasks
# Previousl version:

  # def display_high_priority_tasks
  #   tasks = tasks.select do |task|
  #     task.priority == :high
  #   end

  #   display(tasks)
  # end

# In this version of the method the local variable used to collect the high
# priority tasks is named tasks.
# This causes unexpected behavior.
# When tasks is referenced later on the same line (tasks.select)
# rather than referencing the getter method for @tasks (#tasks)
# the name tasks references the unintitialized local variable tasks.
# The local variable tasks has shadowed the instance method #tasks.
