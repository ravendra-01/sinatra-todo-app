# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/flash'

# Enable sessions for flash messages
enable :sessions

# Middleware to handle HTTP verbs like PATCH and DELETE
use Rack::MethodOverride

# Helper method to assign CSS classes to flash messages based on their type
helpers do
  def flash_class(level)
    case level
    when :notice then 'bg-green-500'
    when :error then 'bg-red-500'
    else 'bg-blue-500'
    end
  end
end

# Route to display all todo items
get '/' do
  @todos = Todo.all
  erb :index
end

# Route to create a new todo item
post '/todos' do
  todo = Todo.new(params[:todo])
  if todo.save
    flash[:notice] = 'Todo item created successfully!'
  else
    flash[:error] = 'Error creating todo item!'
  end
  redirect '/'
end

# Route to update the status of a todo item
patch '/todos/:id' do
  todo = Todo.find(params[:id])
  status = todo.completed
  if todo&.update(completed: !status) # Toggle the completed status
    flash[:notice] = 'Todo item updated successfully!'
  else
    flash[:error] = 'Error updating todo item!'
  end
  redirect '/'
end

# Route to delete a todo item
delete '/todos/:id' do
  todo = Todo.find(params[:id])
  if todo&.destroy
    flash[:notice] = 'Todo item deleted successfully!'
  else
    flash[:error] = 'Error deleting todo item!'
  end
  redirect '/'
end
