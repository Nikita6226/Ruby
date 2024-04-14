require_relative 'task'

class TaskManager
  def initialize
    @tasks = []
    load_tasks
  end

  def start
    display_menu
    user_input = gets.chomp.downcase
    while user_input != 'q'
      case user_input
      when '1'
        list_tasks
      when '2'
        add_task
      when '3'
        complete_task
      else
        puts "Invalid option, please try again."
      end
      display_menu
      user_input = gets.chomp.downcase
    end
    save_tasks
    puts "Exiting task manager. Goodbye!"
  end

  private

  def display_menu
    puts "\nTask Manager Menu:"
    puts "1. List Tasks"
    puts "2. Add Task"
    puts "3. Complete Task"
    puts "Q. Quit"
    print "Choose an option: "
  end

  def list_tasks
    puts "\nTasks:"
    @tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end

  def add_task
    print "Enter task description: "
    description = gets.chomp
    @tasks << Task.new(description)
    puts "Task added successfully."
  end

  def complete_task
    print "Enter task number to mark as completed: "
    task_number = gets.chomp.to_i
    if task_number.between?(1, @tasks.length)
      @tasks[task_number - 1].mark_as_completed
      puts "Task marked as completed."
    else
      puts "Invalid task number."
    end
  end

  def load_tasks
    if File.exist?('public/tasks.txt')
      File.open('public/tasks.txt', 'r') do |file|
        file.each_line do |line|
          description, completed = line.chomp.split(',')
          task = Task.new(description)
          task.mark_as_completed if completed == 'true'
          @tasks << task
        end
      end
    end
  end

  def save_tasks
    File.open('public/tasks.txt', 'w') do |file|
      @tasks.each do |task|
        file.puts "#{task.description},#{task.completed}"
      end
    end
  end
end
