class Api::TodoListsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	# disable csrf for curl request otherwise it breaks 
	def index
    	render json: TodoList.all
  	end

  	def show
  		list = TodoList.find(params[:id])
  		render json: list
  	end

  	def create
  		list = TodoList.new(list_params)
  		if list.save
  			head 200
  			# success
  		else 
  			head 500
  			# fail
  		end
  	end

  	private 

  	def list_params
  		params.require("todo_list").permit("title")
  	end
end