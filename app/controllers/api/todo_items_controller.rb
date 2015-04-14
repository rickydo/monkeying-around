class Api::TodoItemsController < Api::ApiController
	# double colons is a namespace resolution operator, it allows
	# you to access items in modules or class level items in classes
	before_filter :find_todo_list

	def create
		item = @list.todo_items.new(item_params)
		if item.save
			render status: 200, json: {
				message: "successfully created to-do item",
				todo_list: @list,
				todo_item: item
			}.to_json
		else
			render status: 422, json: {
				message: "to-do item creation failed",
				errors: item.errors
			}.to_json
		end
	end

	def update
		item = @list.todo_items.find(params[:id])
  		if list.update(item_params)
  			render status: 200, json: {
  				message: "item successfully updated",
  				todo_list: @list,
  				todo_item: item
  			}.to_json

  		else
  			render status: 500, json: {
  				message: "item could not be updated",
  				errors: item.errors
  			}.to_json
  		end
	end

	def destroy
		item = @list.todo_items.find(params[:id])
  		item.destroy
  		rendor status: 200, json: {
  				message: "item successfully deleted from To-do List",
  				todo_list: @list,
  				todo_item: item
  		}.to_json
	end

	private
	def item_params
		params.require("todo_item").permit("content")
	end

	def find_todo_list
		@list = TodoList.find(params[:todo_list_id])
	end
end
