# monkeying-around
rails api practice 


APIs (Application Programming Interface)

APIs don't exist in isolation. They expose functionality of an application or service that exists independently of the API.

Constraints:
cacheable, uniform interface, layered system, code on demand, stateless, client-server relationship

use curl <uri>.json in terminal to test api

create:
curl \
-i \
-H "Accept: application/json" \
-H "Content-type: application/json" (this says json is being sent to server and not one whole string")
-X POST \
-d '{"title":"The will go here"}' http://localhost:3000/api/todo_lists

where: 
-i tells it to include the header in the output
-H sends it a header to accept json
-X to use HTTP request 
-d data