require "./Contact"

class Diary

	def initialize()
		@contacts = []
		system('cls')
		mainMenu()
	end

	#print de Main Menu
	def mainMenu
		system('clear')
		puts "\n\t*********    WELCOME TO THE DIARY    ********"
		puts "\t********    ======================    *******\n"
		puts "\n\t*******	   	    MENU        	*****"
		puts "\t*-------------------------------------------*"
		puts "\t*******		[1] Add new contact 	*****"
		puts "\t*-------------------------------------------*"
		puts "\t*******	 	[2] View contacts 	*****"
		puts "\t*-------------------------------------------*"
		puts "\t*******	 	[3] Delete contact 	*****"
		puts "\t*-------------------------------------------*"
		puts "\t*******	 	[4] EXIT 		*****"
		puts "\t*-------------------------------------------*"
		print "\n select a option from main menu => "
		STDOUT.flush
		_option = gets.chomp

		case _option
		when "1"
			system('cls')
			addContact()
		when "2"
			system('cls')
			viewContacts()
		when "3"
			system('cls')
			deleteContact()
		when "4"
			system('cls')
			print "\n\t\t\t\t*** Good bye. Thanks for use me! :D ***"
			exit	
		else
			system('cls')
			mainmenu()
		end
	end

	#print each contacts registered
	def viewContacts
		puts "\n\t#\t Name \t\t#\t Lastname \t#\t Address \t#\t Telephone \t# "
		puts "\t*=======================*=======================*=======================*=======================*"
		@contacts.each do |elem| 
			puts "\t| #{elem.name} \t\t| #{elem.lastname} \t\t| #{elem.address} \t\t| #{elem.telephone} \t\t|"
			puts "\t*-----------------------*-----------------------*-----------------------*-----------------------*"
		end

		print "\nDo you want return to main menu? y/n => "
		STDOUT.flush
		_option = gets.chomp

		if _option == "n"
			system('cls')
			viewContacts()
		else
			system('cls')
			mainMenu()
		end
	end	

	def addContact()
		print "Please insert a name: " 
		_name = gets.chomp

		print "Please insert a lastname: "
		_lastname = gets.chomp

		print "Please insert a address: "
		_address = gets.chomp

		print "Please insert a telephone: "
		_telephone = gets.chomp

		_contact = Contact.new(_name, _lastname, _address, _telephone)

		@contacts.push(_contact)

		system('cls')
		print "Do you want try again? y/n => "
		STDOUT.flush
		_option = gets.chomp

		if _option == "y"
			system('cls')
			addContact()
		else
			system('cls')
			mainMenu()
		end
	end

	def deleteContact()
		puts "\n\t#\t ID \t\t#\t Name \t\t#\t Lastname \t# "
		puts "\t*=======================*=======================*=======================*"
		_id = 1
		@contacts.each do |elem| 
			puts "\t| #{_id} \t\t\t| #{elem.name} \t\t| #{elem.lastname} \t\t|"
			puts "\t*-----------------------*-----------------------*-----------------------*"
			_id = _id+1
		end

		print "\n\t Select a name for delete contact => "
		STDOUT.flush
		_select_id = gets.chomp.to_i - 1

		system('cls')
		if _select_id + 1 <= @contacts.length
			@contacts.delete_at(_select_id)
		else
			puts "Select a Id from the table. Press ENTER"
			gets
			system('cls')
			deleteContact()
		end
		puts "\n\tthe contact #{_select_id+1} was remove success!"

		print "\n\tDo you want return to main menu? y/n => "
		option = gets.chomp

		if option == "n"
			system('cls')
			deleteContact()
		else
			system('cls')
			mainMenu()
		end
	end

end