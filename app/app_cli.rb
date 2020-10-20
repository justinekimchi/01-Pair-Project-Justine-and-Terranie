#  require_relative './config/environment'
   #will contain all of our logic
   #not an AR class so no need to inherit from AR
require 'pry'  

class AppCLI
    attr_reader :customer

    def run
      welcome
      #login_or_signup
      #browse_packages
    end

    private 

    def welcome
      puts "Welcome to Wash On Wheels!!" 
      sleep(3.5)
      puts "Customized Car Detailing Delivered to Your Door!"
      sleep (2.0)
      puts "How can we W.O.W. you today?"
      sleep(3.5)
    end
    
end