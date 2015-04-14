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
  			
  			rendor status: 200, json: {
  				message: "Successfully created To-do List",
  				todo_list: list
  			}.to_json
  		else 
  			render status: 422, json: {
  				message: list.errors
  			}.to_json
  		end
  	end

  	def update
  		list = TodoList.find(params[:id])
  		if list.update(list_params)
  			render status: 200, json: {
  				message: "successfully updated",
  				todo_list: list
  			}.to_json

  		else
  			render status: 500, json: {
  				message: "could not be updated",
  				todo_list: list
  			}.to_json
  		end
  	end

  	def destroy
  		list = TodoList.find(params[:id])
  		list.destroy
  		rendor status: 200, json: {
  				message: "Successfully deleted To-do List",
  		}.to_json
  	end

  	private 

  	def list_params
  		params.require("todo_list").permit("title")
  	end
end