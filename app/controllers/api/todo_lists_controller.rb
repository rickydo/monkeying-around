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
  			
  			rendor json: {
  				status: 200,
  				message: "Successfully created To-do List",
  				todo_list: list
  			}.to_json
  		else 
  			render json: {
  				status: 500,
  				message: list.errors
  			}.to_json
  		end
  	end

  	def destroy
  		list = TodoList.find(params[:id])
  		list.destroy
  		rendor json: {
  				status: 200,
  				message: "Successfully deleted To-do List",
  		}.to_json
  	end

  	private 

  	def list_params
  		params.require("todo_list").permit("title")
  	end
end