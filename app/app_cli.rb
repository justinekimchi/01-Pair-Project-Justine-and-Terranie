   require 'pry'  
   require 'tty-prompt'
   
   class AppCLI
       attr_accessor :existing_customer, :new_customer, :existing_customer_instance
   
   
      def run
         system("clear")
         logo 
         welcome
         menu
         
      end
   
       private 

       def logo 
        puts  "
        .    .   .       .       .       .       .       .       .       .       .       .          .  .  
             .   .   .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  .  .   .   .
          .    .      .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .  .   .  
            .     . .   .   .   .   .   .   .   .   .   .   ..8S@8@@88888XS%t::...  .   .   .   .           
          .   .           .       .       .       .  X@@@88@X:8;t  ...;t%SX@888888@@@@88888@@S:    .  . .  .
            .   . .  . .     . .     . .     . .    @%:    .S.X @.         .           . :tX8S.S .          
          .         .    .       .       .       .:S@@888:%@8%8S.    .  .        .  .   .  X%X8S%:  . .  .  
             . .  .    .   . .     . .     . .     :.XtX::88X:.:X  .     .  .  .      .  %@8. t @%@%S:  .  .
          .          .         . .     . .     .  . X88St%;%@.%;%.    .          . .    @:;    .:@@88 :     
            .  . . .    . .  .     .       .    . ;@S@ 8.   ..@@    .   . .  .       .;XX:  . . .8::@XS: .  
          .           .        .     . .     .  tSX@888:t8%%S8%@tt ::.t%X@8888X@X%;:%SX;  .       .88.SS;  .
            . .  .  .    . . .   .  .    .  .  8X:X@ .. ; .tSX  %;::;::.:.;%t;S8@8@8XS  .    .      8X.%8.  
          .       .   .           .    .   . %.S.  8 ... ;8@t;:.%S .....:. : .: .:S%%  .   .   . .  .;;8.   
           .  . .       .  .  . .    .   . %.: .. .S@. 8tX@:.SXXt8X.;;. .. .:..:.S@8@:   .   X%St  S;X    . 
                   . .    .        .      88t  . ..;@8%8.8  %X;;S@8;.@8;.;... ..88X%.S      88  :XX;;   .   
         .  .  .  .    .    .  .  .   . X.S.. .:..% %@% S%:   t88X88% 8X;....::;@8@;t8X: . ;.;; .:%:  .    .
           .    .    .   .     .tX@888@t8SXXSX8@S; ;S X@S8S::..;;.;;X;X@S:  .t;:.% 8  X:%  @@8X. :.      .  
             .     .       . . @88@t:X8;...;XSS:8@%: @XX8 @S;8;t:  . 88;t 88 ;         % ; S8:S t.%.  .     
         .    .  .    . .     .:X  %.S::.8888.S.;  .S@%%.88:X8t .    8t8:t:;;;          @t: @:.S 88    .  . 
           .    .   .     .   @..;t; .X88  @    8@S8.88S:S;XX    .  .X@;:8@8.  .    . .  @t8@.tXtt  .    .  
          .  .    .   .    .  t8t%t..@8 .S8SSS:8@@X.%.@;;..:X; .   . XXS8:S.     .        .t .;::    .      
            .   .       .    X;S8:...@.;..X88%% 88..t:.  :. SS:;%S@@8;8:SX    .    .  . %X8      . .   .  . 
          .   .    . .   .  ;%8X; ;%t8;..: 8%.@S888; ::.;;t%SS .8X%S8.SX.;  .   .     :88. .  .         .   
                 .     .   S:8t%t;.XX .     .t.:. .     .   ;;X.    %8  t8    .   . .:t@  .     .  . .    . 
          . .  .    .    :8St     ;:;    .  :;@      .    :8%%   . @t.. X.. .       SSS  .  .  .       .  . 
              .   .   .:8X%  .  . %8   .   :t@.  . .   ..8SS      %::.  .;8   . . tX8.        .  .  .     . 
          .     .   . %.8     .  ;.:     . XX          .:%.   . . ;8     8: .    S;t.  .  .        .  . .  .
            .     .  8%t   .     @@  . .  @;:  . .  . Xt8.  .    8t.  .  :.t  ..8@;     .   .  .            
          .   . .  ;%8       .  %...     S::  .     %S8.       .t.;     . 8:. tSX  . .    .   .  .  . . . . 
            .     :.@   . .    .S8    . ..%.     . 8:%  . .  .  ;8 . .   .. S%;;  .    .    .     .         
         .    .  X%X  .    .  .t.:  .  .X@   .  .;X@;       .  8;. .8t8.   8 @; .    .   .     .     .  .  .
           .   %X8: .   .     .:@     .X8  .   :8St  .  .     X::  ::..;t S;@ .    .       .  .  .  .       
         .   .%:%     .   . . X;  .   @;.     ;.@  .   . .::tStX . 8.  .8: t     .    . .             .  .  
           . @%%;;;;tSS%S%S@@8;:888@SSXt88St%:@%:.;88888@88;:8::.  8 .: :X. .  .    .     . .  .  . .   .  .
            ;.8.888@@XX%%%%SS88888888 @X88888X888t:       .S8%SS@%.S:  @t;;      .    .       .             
         .  S%SS. .       .@%8@88%tSt88XX@888@8@8X   .  .  ;t88X  X:t.S :.. . .    .    . .     . .  . . .  
            X@8@     .    .S@8X8 8888 88888888@ ;:;ttt%SSS@;8. 8:SX%.8:;8;      .    .      . .            .
          ..:Xt;S@88XSSX@88X;;.;:.: .X. :..  t;%8@@888XStttt;;.  %X. :X8t . .     .    .  .      . . .  .   
           Xt8X@888888888St::..                   . .  .       .%.t   . .     . .   .   .   .  .          . 
         . .%%   .. . ......::::::...::;;;;;;;t;:;t%SXX@@@88888@8t  .     .       .   .          .  . .  .  
            SS888888@88888888@@@@8888888XXXXXX@888XX%tt;:::...    .    .    . .     .    . . .              
          .   .   . . .     .       ..        .      .     .  .      .   .      .      .      . . .  . .  . 
               .         .     . .     .  .     . .     .       .  .   .   .  .   .  .    .              .  
          . .    .  .  .   .  .    .     .  . .     .  .  . .  .     .      .   .   .   .   .  .  . .  .  ".colorize(:red)  
      end 

   
      def welcome
         font = TTY::Font.new(:standard)
         pastel = Pastel.new
         puts pastel.yellow(font.write("WASH-ON-WHEELS", letter_spacing:4))
         puts "Welcome to Wash On Wheels!!" 
         sleep(1.5)
         puts "Customized Car Detailing Delivered to Your Door!"
         sleep (2.0)
         puts "How can we W.O.W. you today?"
         sleep(1.5)
   
         puts "🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽🚙🚗🧽"
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
         @existing_customer=name_array.find {|name|name==answer}
            if @existing_customer
              puts "\nWelcome back, #{answer.split(" ").first}!"
              sleep(4.0)
              prompt=TTY::Prompt.new
              selection=prompt.select ('How would you like to get started?') do |menu|
              menu.choice'View My Order History',->{order_history}
              menu.choice'View Packages', ->{package_menu}
              end
            else
              puts "Welcome to the WOW experience, #{answer.split(" ").first}! \nRegistration will only take a minute or your money back! j/k!"
              sleep(4.0)
              register
            end

          

      end 

      def service_price
        a=Package.all.map {|package| package.price}
        a[0]
          
      end 
      
      def update_address
        puts "What is your new address?"
        answer=gets.chomp        
        user = Customer.find_by(name: @existing_customer) #if we don't know the parent id, we can still update any value in a hash using this code
        user.update(address: answer)
        order_confirmation
      end

      def address_confirmation   
        system("clear")
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red(font.write("UPDATE   US", letter_spacing:2))

        @existing_customer_instance= Customer.all.select {|customer|customer.name == @existing_customer}
        @existing_customer_address=(@existing_customer_instance.map{|i|i.address})*(',')

        @existing_customer_address 
          prompt = TTY::Prompt.new
          selection=prompt.select("Just to confirm your address... Do you still reside at #{@existing_customer_address}?") do |menu|
            menu.choice 'Yes', -> {order_confirmation}
            menu.choice 'No', ->{update_address}
          end 
      end

      def new_or_existing_customer
        prompt=TTY::Prompt.new
        selection=prompt.select('If this is your first time ordering, please proceed to order confirmation. Otherwise, please verify your address for us.') do |menu|
          menu.choice 'Order Confirmation',-> {order_confirmation}
          menu.choice 'Confirm/Update Address',->{address_confirmation}
        end
      end
      
     
        
      def order_confirmation
        system("clear")
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.yellow(font.write("SCHEDULE APPOINTMENT", letter_spacing:2))
        puts "==================================================================================="
        
        puts "Please give us a convenient date(MM/DD)and we'll call you to set up an appointment between 7 AM-7 PM"
        answer=gets.chomp
        puts "What is the make and model of your vehicle so we know what to look for?"
        answer2=gets.chomp
        puts "Thank you for your order! We'll see you on #{answer}. Your customized car wash is on its way for your #{answer2}!"
        sleep(3.5)
        font = TTY::Font.new(:doom)
        pastel = Pastel.new
        puts pastel.red(font.write("YOU'RE ALL SET!", letter_spacing:2))
        puts "==================================================================================="
        sleep(6.0)
        system("clear")
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.yellow(font.write("BACK TO MAIN MENU", letter_spacing:2))
        menu
      end 

      def contact 
        puts "==================================================================================="
        puts "We apologize for any difficulties you experienced ordering your service online. \nPlease give us a call at (281) 765-7689 or email us at help@wowzers.com \nand one of our representatives will be delighted to assist you!"
        menu
      end 

     
        
      def order_history 
        system("clear")
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
      
        puts pastel.yellow(font.write("ORDER HISTORY", letter_spacing:2))

        puts "==================================================================================="
        puts "Below you will see the vehicle(s) that you have had serviced with us previously:"
        sleep(1.5)
        a = Customer.first.vehicles[0].make 
        b=  Customer.first.vehicles[0].model
        c = Customer.first.vehicles[1].make
        d = Customer.first.vehicles[1].model
        puts "#{a} #{b} and #{c} #{d}"
          
        sleep(1.5)
  
        puts "==================================================================================="
        puts "Here is also a list of your previous packages:"
        f= Customer.first.vehicles[0].services[0].package.name 
        g = Customer.first.vehicles[1].services[0].package.name 
        puts "#{f}\n#{g}"
        
        
        
        
          
        puts "==================================================================================="
        sleep(1.5)
  
        prompt=TTY::Prompt.new
        selection=prompt.select("How do you wish to proceed?") do |menu|
          menu.choice 'View Packages',-> {package_menu}
          menu.choice 'Contact Us',->{contact}
          menu.choice 'Exit',-> {exit}
        end 
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
         system("clear")
         font = TTY::Font.new(:doom)
         pastel = Pastel.new
         puts pastel.yellow(font.write("COME  BACK  SOON", letter_spacing:1))
        puts "We hate to see you go! Until next time!"
      end 

      def service_menu 
            system("clear")
            font = TTY::Font.new(:standard)
            pastel = Pastel.new
            puts pastel.red(font.write("SERVICE  MENU", letter_spacing:4))
            prompt = TTY::Prompt.new
            prompt.select("How would you like to proceed?") do |menu|
            menu.choice "Complete Order", -> {address_confirmation}
            menu.choice 'View Service History' ,-> {order_history}
            menu.choice "Change Order", -> {package_menu}
            menu.choice "Delete Order", -> {delete_menu}
            menu.choice "Exit",->{exit}
        end 
      end 
       
      def coupe_price
        coupe = service_price + 5
        puts "==================================================================================="
        puts "Awesome! For your Coupe, the service total will amount to $#{coupe}.00"
        new_or_existing_customer
       
      end  

      def sedan_price 
        sedan = service_price + 10
        puts "==================================================================================="
        puts "Great! For your Sedan, the service total will amount to $#{sedan}.00"
        new_or_existing_customer
      end 

      def truck_price
        truck = service_price + 25
        puts "==================================================================================="
        puts "Perfect! For your Truck, the service total will amount to $#{truck}.00"
        new_or_existing_customer
      end 

      def van_price 
        van = service_price + 15
        puts "==================================================================================="
        puts "Excellent! For your Van, the service total will amount to $#{van}.00"
        new_or_existing_customer
      end 

      def exterior_auto_detailing
        system("clear")
        font = TTY::Font.new(:standard)
         pastel = Pastel.new
         puts pastel.yellow(font.write("EXTERIOR PACKAGE", letter_spacing:3))
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
        system("clear")
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red(font.write("INTERIOR  AUTO   DETAILING", letter_spacing:1))
        puts "==================================================================================="
        puts "Excellent choice! This premier service includes: \n •seat cleaning \n •interior surface cleaning \n •floor cleaning \n •deodorizing"  
       
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
        system("clear")
        font = TTY::Font.new(:standard)
        pastel = Pastel.new
        puts pastel.red(font.write("PROTECT & RESTORE", letter_spacing:2))
        puts "==================================================================================="
        puts "Your wish is our commnand! This reconstructive service includes: \n •headlight restoration \n •engine wash \n •exterior coating \n •minor dent repair" 
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
         font = TTY::Font.new(:starwars)
         pastel = Pastel.new
         puts pastel.red(font.write("PACKAGES", letter_spacing:3))
         
         puts "============================================================================================================"
         prompt = TTY::Prompt.new
         prompt.select("Please select one of our available packages:") do |menu|
           menu.choice "Exterior Auto Detailing", -> {exterior_auto_detailing}
           menu.choice "Interior Auto Detailing", -> {interior_auto_detailing}
           menu.choice "Protective Restorative Treatments", -> {protective_restorative_treatments}
           menu.choice "Exit",->{exit}
         end 
      end
  
   
       
       def register 
            system("clear")
            font = TTY::Font.new(:starwars)
            pastel = Pastel.new
            puts pastel.yellow(font.write("REGISTER", letter_spacing:2))
            puts  "𝕎 𝔼 𝕃 𝐂 𝕆 𝕄 𝔼 🏎💨💨💨💨💨💨💨💨"
            sleep(2.0)
            prompt = TTY::Prompt.new
            prompt.ask('What is your first and last name?', required: true)
            answer1=gets.chomp
            prompt.ask('What is your address?(Only street address required. We only service Houston clients.)',require: true)
            answer2 = gets.chomp 
            prompt.ask('What is your phone number? (Please put in format ##########))', require: true)
            answer3 = gets.chomp 
            prompt.ask('What is your email address?', require: true)
            answer4 = gets.chomp
            @new_customer=Customer.create(name:answer1, address: answer2, phone_number: answer3, email: answer4)
            puts "🎉𝙍𝙀𝙂𝙄𝙎𝙏𝙍𝘼𝙏𝙄𝙊𝙉 𝘾𝙊𝙈𝙋𝙇𝙀𝙏𝙀!🎉"
            sleep(2.0)
            puts "Thank you for supporting small businesses!!"
            sleep(2.5)
            package_menu
           
       end

       

   
       
   
  
       
   end

