# frozen_string_literal: true

require 'sinatra'
require 'mongoid'
# require './models/post'
# require './models/comment'

# DB Setup
Mongoid.load! 'mongoid.yml'

# Require all models
Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each { |file| require file }

# Require all route files
Dir[File.join(File.dirname(__FILE__), 'routes', '*.rb')].each { |file| require file }


# get '/' do
#   @posts = Post.all
#   erb :index
# end

# get '/posts/new' do
#   erb :new_post
# end

# post '/posts' do
#   post = Post.create!(params[:post])
#   redirect "/posts/#{post.id}"
# end

# get '/posts/:post_id' do |post_id|
#   @post = Post.find(post_id)
#   erb :show_post
# end

# get '/posts/:post_id/comments/new' do |post_id|
#   @post_id = post_id
#   erb :new_comment
# end

# post '/posts/:post_id/comments' do |post_id|
#   post = Post.find(post_id)
#   post.comments.create!(params[:comment])
#   redirect "/posts/#{post_id}"
# end
