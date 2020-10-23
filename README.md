# Module One Project: CRUD CL APPLICATION 

Wash On Wheels (W.O.W.) is a state-of-the-art Command Line Application with CRUD capabilites. Its functionality enables users to order customized car detailing and wash services without leaving their doorstep. Customers can register and log onto the app, browse through packages, make selections, change or delete existing information stored on file, or contact a representative for further assistance.  

# Install Instructions 

1. Fork and clone this repository using this link: 
2. Ensure that the following gems are installed in your 'Gemfile' : colorize, tty-prompt, tty-font, pry, activerecord, sqlite3, and rake. If not, you will need to 'gem install' each of them individually, delete 'Gemfile.lock' and run 'bundle' in order for the code to run succesfully.
3. You're all set. Happy coding! 


# Contributor Guide 

The foundation of this application is centered around 4 models: Customer, Vehicle, Package, and Service. These classes are listed in the 'app/models' folder and the structure of their tables can be viewed in 'db/migrate'.

***Important: Any modifications that you wish to make to these four models cannot be done in the existing migration files. You must create a new migration and run 'db:migrate" in order for changes to be properly applied. Do not make any changes to the 'db/schema.rb' file either. Any migrations that you create will automatically be reflected in this file so there is no need to modify it. 

In the 'db/seeds.rb' file, you will find a list of the instances that we created to test our methods. Feel free to add more as you see fit.  

The 'app/app_cli' file contains the 'AppCLI' class, which is the interface of our application. It structures everything that a user sees when we run 'ruby bin/run.rb'. The AppClI consists of two attribute accessors: existing_customer and new_customer, and it also contains the followingn methods:

#run - this method jumpstarts how the application will navigate starting with the welcome message and menu screen 

#logo - this method displays our logo 

#welcome - this method welcomes users to our app

#menu - this method gives users four options: Login, Register, Contact Us, or Exit 

#login - this method allows existing users to login or redirect new users to the register method 

#service_price - this is a helper method that returns the base price of every package 

#update_address - this method gives an existing user the option to update their address

#address_confirmation - this method allows existing users to verify the address saved on file, otherwise, they can make a selection to go to the next menu to update it 

#new_or_existing_customer - this method asks returning customers to confirm their address before checking out or otherwise, any new customers can proceed to checkout page

#order_confirmation - this method allows users to specify their chosen date of service and to specify which vehicle will be serviced 

#contact - this method provides users with contact information for the company 

#order_history - this method displays the details of past vehicles that were serviced and which packages were chosen 

#delete_menu - after confirming that an order has been deleted for a customer, this method prompts them with choices on how to proceed 

#exit - this method allows users to exit the application

#service_menu - this method allows users to complete an order, view service history, change their order, delete their current order or exit the application

#coupe_price - this method uses the #service_price helper method to determine the total cost of the specific package chosen for service 

#sedan_price - this method uses the #service_price helper method to determine the total cost of the specific package chosen for service 

#truck_price - this method uses the #service_price helper method to determine the total cost of the specific package chosen for service 

#van_price - this method uses the #service_price helper method to determine the total cost of the specific package chosen for service 

#exterior_auto_detailing - this method lists the details of the chosen package and prompts them to select a vehicle type to be serviced with this package

#interior_auto_detailing - this method lists the details of the chosen package and prompts them to select a vehicle type to be serviced with this package

#protective_restorative_treatments - this method lists the details of the chosen package and prompts them to select a vehicle type to be serviced with this package

#package_menu - this method allows users to select one of our available packages or exit application

#register - this method allows new users to register and be saved into the application database. It also prompts them with the package menu 








