require "./Contact"

class Diary

	def initialize()
		@contacts = []
		system('cls')
		mainmenu()
	end

	def mainmenu
		system('clear')
		puts "\n\t*********    WELCOME TO THE DIARY    ********"
		puts "\t********    ======================    *******\n"
		puts "\n\t*******	   	    MENU        	*****"
		puts "\t*-------------------------------------------*"
		puts "\t*******	 	[1] View contacts 	*****"
		puts "\t*-------------------------------------------*"
		puts "\t*******		[2] Add new contact 	*****"
		puts "\t*-------------------------------------------*"
		puts "\t*******	 	[3] Delete contact 	*****"
		puts "\t*-------------------------------------------*"
		puts "\t*******	 	[4] EXIT 		*****"
		puts "\t*-------------------------------------------*"
		print "\n select a option from main menu => "
		STDOUT.flush
		option = gets.chomp

		case option
		when "1"
			system('cls')
			viewContacts()
		when "2"
			system('cls')
			addContact()
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

	def viewContacts
		puts "\n\t#\t Name \t\t#\t Lastname \t#\t Address \t#\t Telephone \t# "
		puts "\t*=======================*=======================*=======================*=======================*"
		@contacts.each do |elem| 
			puts "\t| #{elem.name} \t\t| #{elem.lastname} \t\t| #{elem.address} \t\t| #{elem.telephone} \t\t|"
			puts "\t*-----------------------*-----------------------*-----------------------*-----------------------*"
		end

		print "\nDo you want return to main menu? y/n => "
		STDOUT.flush
		option = gets.chomp

		if option == "n"
			system('cls')
			viewContacts()
		else
			system('cls')
			mainmenu()
		end
	end	

	def addContact()
		print "Please insert a name: " 
		name = gets.chomp

		print "Please insert a lastname: "
		lastname = gets.chomp

		print "Please insert a address: "
		address = gets.chomp

		print "Please insert a telephone: "
		telephone = gets.chomp

		contact = Contact.new(name, lastname, address, telephone)

		@contacts.push(contact)

		system('cls')
		print "Do you want return to main menu? y/n => "
		STDOUT.flush
		option2 = gets.chomp

		if option2 == "n"
			system('cls')
			addContact()
		else
			system('cls')
			mainmenu()
		end
	end

	def deleteContact()
			print "\n\t Select a ID for delet contact =>"
			STDOUT.flush
			id = gets.chomp

			@contacts
	end

end