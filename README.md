This repo is the backend for a running app hosted at https://github.com/eschechter/running-frontend. For more information on the application, please see the README in that repo.

To get the backend running, clone the directory and run 

### `bundle`

For this to work, you'll need to have upgraded to Ruby 2.6.4 and have postgresql installed on your computer. Next, run 

### `rails db:setup`

to create and seed the database. Then, run 

### `rails s`

to start the server. Finally, refer to the instructions in https://github.com/eschechter/running-frontend to get the React frontend up and running.