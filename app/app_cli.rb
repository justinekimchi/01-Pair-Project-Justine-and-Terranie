   require 'pry'  
   require 'tty-prompt'
  #  require 'colorize'
   
   class AppCLI
       attr_accessor :current_customer 
   
   
      def run
         system("clear")
         logo 
         sleep(2.0)
         system("clear")
         welcome
         menu
         
      end
   
       private 

       def logo 
        puts                      "_...--------..._
        ..       ______________       -.
       :_..-------- ___......___ ----------..
     ... _.---------  (______) --..------. .
    ...   .----.               .-----.  \  \
   / /    /      \             /       \  \  \
.---.  / /    :        :           :,-------.:  \  \  .--..
:    \: :   __:____....J.---------.:...______:   :  :     :
-----._ -----_______......---------......______----- _.----
/ \------             ..                   --------/.
/ ..                                        . . .
/    \ .                                    . .    \
/      . -._                            _.- .      _:
:|-------.._    .....--------------------.....     _..---.. |:
::   /--\  -.    _____..............______    .-_ /...\   ::
| ._\__/ -----.  : 888888888P:.d888888P   : --- \__/_. |
|-._  -------  : T888888P|__|88888888P  :  -------  _.|
:    ----._     :  .T8P .d88888888888P.------     __.----  |
:-.        ======    ------     .------..     ,:
|: ..,_          \                         :       __...-:|
|:   88PTp.    d88888888888888888888888P    .dPT88P   :|
:8p.  8b_d88b    888888888888888888888888   d88b_dP   d8:
8888b..___----     ------- -    -------_....gd888
88888888  ------   -----------..---------------      888888..
888888P                                    fsc   T888888P
------".colorize(:cyan)
      end 
   
      def welcome
       
         puts "Welcome to Wash On Wheels!!" 
         sleep(1.5)
         puts "Customized Car Detailing Delivered to Your Door!"
         sleep (2.0)
         puts "How can we W.O.W. you today?"
         sleep(1.5)
   
         puts "🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽"
      end
   
      def menu 
         prompt = TTY::Prompt.new
         selection=prompt.select("\nPlease select an option.") do |menu| 
           menu.choice 'Login', -> {login}
           menu.choice 'Register', -> {register}
           menu.choice 'Contact Us', ->{contact}
           menu.choice 'Exit', -> {exit}
         end
      end
   
      def login
        
         puts "➤Please log in by entering your first and last name."
         answer = gets.chomp

         name_array=Customer.all.map{|customer|customer.name}
         @current_customer=name_array.find {|name|name==answer}
            if @current_customer
              puts "\nWelcome back, #{answer.split(" ").first}!"
              sleep(2.0)
              package_menu
            else
              puts "Welcome to the WOW experience, #{answer.split(" ").first}! \nRegistration will only take a minute or your money back! j/k!"
              sleep(2.0)
              register
            end

      end 

      def service_price
        a=Package.all.map {|package| package.price}
        a[0]

        #  package = Package.all.select {|package| package.id == 1}
        #  package.sum {|package|package.price}
          
      end 

      def order_confirmation
        puts "==================================================================================="
       puts "Please give us a convenient date(MM/DD)and we'll call you to set up an appointment between 7am-7pm"
         answer=gets.chomp
         #are you still living at this address
        puts "Thank you for your order! You're all set. We'll see you on #{answer}. Your customized car wash is on its way!"
        puts "==================================================================================="
        menu
      end 

      def contact 
        puts "==================================================================================="
        puts "We apologize for any difficulties you experienced ordering your service online. \nPlease give us a call at (281) 765-7689 or email us at help@wowzers.com \nand one of our representatives will be delighted to assist you!"
        menu
      end 

      def order_history 
        #not working yet
        @current_customer_hash=Customer.all.find{|customer|customer.name == @current_customer}
        
        vehicle_id = Vehicle.all.map{|vehicle|vehicle.customer_id}
        a=@current_customer_hash.id 
        my_orders = Service.all.map {|service| service.vehicle_id}
        my_orders.find {|id|id==a}

        @current_customer.id
        delete_menu

        
      end

      def delete_menu
        puts "==================================================================================="
        prompt = TTY::Prompt.new
        selection=prompt.select('As you wish! Your order has been deleted. How would you like to proceed?') do |menu|
         menu.choice 'View Past Services History' ,-> {order_history}
         menu.choice 'Create New Order', ->{package_menu}
         menu.choice 'Contact a Representative', ->{contact}
         menu.choice 'Exit', ->{exit}
        end 
      end 

      def exit 
        puts "We hate to see you go! Until next time!"
      end 

      def service_menu 
          prompt = TTY::Prompt.new
          prompt.select("How would you like to proceed?") do |menu|
            menu.choice "Complete Order", -> {order_confirmation}
            menu.choice "Change Order", -> {package_menu}
            menu.choice "Delete Order", -> {delete_menu}
            menu.choice "Exit",->{exit}
        end 
      end 
       
      def coupe_price
        coupe = service_price + 5
        puts "==================================================================================="
        puts "Awesome! For your Coupe, the service total will amount to $#{coupe}.00"
        service_menu
      end  

      def sedan_price 
        sedan = service_price + 10
        puts "==================================================================================="
        puts "Great! For your Sedan, the service total will amount to $#{sedan}.00"
        service_menu
      end 

      def truck_price
        truck = service_price + 25
        puts "==================================================================================="
        puts "Perfect! For your Truck, the service total will amount to $#{truck}.00"
        service_menu
      end 

      def van_price 
        van = service_price + 15
        puts "==================================================================================="
        puts "Excellent! For your Van, the service total will amount to $#{van}.00"
        service_menu
      end 

      def exterior_auto_detailing
         puts "==================================================================================="
         puts "Great choice! This deluxe service includes:\n •hand washing \n •drying \n •waxing \n •buffing \n •rim cleaning \n •polishing \n •degreasing \n •debugging"  
         puts "==================================================================================="
         prompt = TTY::Prompt.new
         selection=prompt.select('What type of vehicle would you like to have serviced?') do |menu|
          menu.choice 'Coupe' ,-> {coupe_price}
          menu.choice 'Sedan', ->{sedan_price}
          menu.choice 'Truck', ->{truck_price}
          menu.choice 'Van', ->{van_price}
         end
      end
   
      def interior_auto_detailing
        puts "==================================================================================="
        puts "Excellent choice! This premier service includes: \n •seat cleaing \n •interior surface cleaning \n •floor cleaning \n •deodorizing"  
        # current_customer = Customer.find {|customer| customer.name == @customer_name}
        # car1= Vehicle.select {|vehicle| vehicle.customer_id }
        puts "==================================================================================="
        prompt = TTY::Prompt.new
        selection=prompt.select('What type of vehicle would you like to have serviced?') do |menu|
          menu.choice 'Coupe' ,-> {coupe_price}
          menu.choice 'Sedan', ->{sedan_price}
          menu.choice 'Truck', ->{truck_price}
          menu.choice 'Van', ->{van_price}
        end
      end

      def protective_restorative_treatments
        puts "==================================================================================="
        puts "Your wish is our commnand! This reconstructive service includes: \n •headlight restoration \n •engine wash \n •exterior coating \n •minor dent repair" 
        # current_customer = Customer.find {|customer| customer.name == @customer_name}
        # car1= Vehicle.select {|vehicle| vehicle.customer_id }
        puts "==================================================================================="
        prompt = TTY::Prompt.new
        selection=prompt.select('What type of vehicle would you like to have serviced?') do |menu|
          menu.choice 'Coupe' ,-> {coupe_price}
          menu.choice 'Sedan', ->{sedan_price}
          menu.choice 'Truck', ->{truck_price}
          menu.choice 'Van', ->{van_price}
        end
      end
   
      def package_menu 
        system("clear")
        puts "==================================================================================="
         prompt = TTY::Prompt.new
         prompt.select("Please select one of our available packages:") do |menu|
           menu.choice "Exterior Auto Detailing", -> {exterior_auto_detailing}
           menu.choice "Interior Auto Detailing", -> {interior_auto_detailing}
           menu.choice "Protective Restorative Treatments", -> {protective_restorative_treatments}
           menu.choice "Exit",->{exit}
         end 
      end
  
   
       
       def register 
           puts  "𝕎 𝔼 𝕃 𝐂 𝕆 𝕄 𝔼 🏎💨💨💨💨💨💨💨💨"
           sleep(2.0)
           puts "Please enter your first and last name."
           answer1 = gets.chomp 
           puts "What is your address?(Only street address required. We only service Houston clients."
           answer2 = gets.chomp 
           puts "What is your phone number? (Please put in format ##########)"
           answer3 = gets.chomp 
           puts "What is your email address?"
           answer4 = gets.chomp 
           Customer.create(name:answer1, address: answer2, phone_number: answer3, email: answer4)

           puts "🎉𝙍𝙀𝙂𝙄𝙎𝙏𝙍𝘼𝙏𝙄𝙊𝙉 𝘾𝙊𝙈𝙋𝙇𝙀𝙏𝙀!🎉"
           sleep(2.0)
           puts "Thank you for supporting small businesses!!"
           sleep(2.5)
           package_menu
       end 
   
       
   
  
       
   end

