require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new

  end



  def main_menu

    ##2

    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Nuke all entries"
    puts "6 - View Entry n"
    puts "6 - Exit"
    print "Enter your selection: "

    ##3

    selection = gets.to_i

    ##7

    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      system "clear"
      @address_book.nuke
      puts "All entries deleted"
      main_menu
    when 6
      puts "Good-By!"
      ##8
      exit(0)
      ##9

    else
      system "clear"
      puts "Sorry, thats is not a valid input"
      main_menu

  end
end



def entry_n_submenu
  print "Entry number to view: "
  selection = gets.chomp.to_i
  if selection < @address_book.entries.count
    puts @address_book.entries[selection]
    puts "Press entrer to return to main menu"
    gets.chomp
    system "clear"
  else
    puts "#{selection} is not a valid input"
    entry_n_submenu
  end
end



## 10
    def view_all_entries
      ##14
      @address_book.entries.each do |entry|
        system "clear"
        puts entry.to_s
        ##15
        entry_submenu(entry)
      end

      system "clear"
      puts "End of entries"
      ##At #14, iterate through all entries in AddressBook using each. At #15, we call entry_submenu to display a
      ##submenu for each entry. Let's add this method at the bottom of MenuController.
   end



    def create_entry
      ##11
      system "clear"
      puts "New AddressBloc entry"
      ##12
      print "Name: "
      name = gets.chomp
      print "Phone Number: "
      phone = gets.chomp
      print "Email: "
      email = gets.chomp

      ##13

      @address_book.add_entry(name, phone, email)

      system "clear"
      puts "New entry created"
      ##At #11, clear the screen for before displaying the create entry prompts. At #12, use print to prompt the user
      ## for each Entry attribute. print works just like puts, except that it doesn't add a newline. At #13, add
      ## a new entry to address_book using add_entry to ensure that the new entry is added in the proper order.
   end



   def search_entries
   end



   def read_csv
     ##1
     print "Enter CSV file to import"
     file_name = gets.chomp

     ##2

     if file_name.empty?
       system "clear"
       puts "No CSV file read"
       main_menu
     end
     ##3
     begin
       entry_count = AddressBook.import_from_csv(file_name).count
       system "clear"
       puts "#{entry_count} new entries added from #{file_name}"
     rescue
       puts "#{file_name}is not a valid CSV file, please enter the name of a valid CSV file"
       read_csv
     end
     #At #1, we prompt the user to enter a name of a CSV file to import. We get the filename from STDIN and call the chomp method
     # which removes newlines.
     #At #2, we check to see if the file name is empty. If it is then we return the user back to the main menu by calling main_menu.
     #At #3, we import the specified file with import_from_csv on address_book. We then clear the screen and print the number of
     # entries that were read from the file. All of these commands are wrapped in a begin/rescue block. begin will protect the
     # program from crashing if an exception is thrown.




     def delete_entry(entry)
          address_book.entries.delete(entry)
          puts "#{entry.name} has been deleted"
        end
      ##We remove entry from address_book and print out a message to the user that says entry has been removed.
      ##Let's add the ability to edit an entry.




      def edit_entry(entry)
        ##4
        print "Update name: "
        name = gets.chomp
        print "Updated Phone number: "
        phone_number = gets.chomp
        print "Updated Email: "
        email = gets.chomp
        ##4
        entry.name = name if !name.empty?
        entry.phone_number = phone_number if !phone_number.empty?
        entry.email = email if !email.empty?
        system "clear"
        ##6
        puts "Updated entry: "
        puts entry
      end
      ##At #4, we perform a series of print statements followed by gets.chomp assignment statements. Each gets.chomp
      ##statement gathers user input and assigns it to an appropriately named variable.
      ##At #5, we use !attribute.empty? to set attributes on entry only if a valid attribute was read from user input.
      ##At #6, we print out entry with the updated attributes.



def search_entries
  ##9
  print "Search by Name: "
  name = gets.chomp
  ##10
  match = address_book.binary_search(name)
  system "clear"
  ##11
  if match
    puts match.to_s
    search_submenu(match)
  else
    puts "No Match found for #{name}"
 end

#At #9, we get the name that the user wants to search for and store it in name.
#At #10, we call search on address_book which will either return a match or nil,
# it will never return an empty string since import_from_csv will fail if an entry does not have a name.
#At #11, we check if search returned a match. This expression evaluates to false if search returns nil
# since nil evaluates to false in Ruby. If search finds a match then we call a helper method called
# search_submenu. search_submenu displays a list of operations that can be performed on an Entry.
# We want to give the user the ability to delete or edit an entry and return to the main menu when a match is found.


def search_submenu(entry)
  ##12
  puts "\nd - delete entry"
  puts "e - edit this entry"
  puts "m - return to main menu"
  ##13
  selection = gets.chomp
  ##14
  case selection
       when "d"
         system "clear"
         delete_entry(entry)
         main_menu
       when "e"
         edit_entry(entry)
         system "clear"
         main_menu
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         puts entry.to_s
         search_submenu(entry)
     end
   end
#At #12, we print out the submenu for an entry.
#At #13, we save the user input to selection.
#At #14, we use a case statement and take a specific action based on user input.
# If the user input is d we call delete_entry and after it returns we call main_menu.
#If the input is e we call edit_entry. m will return the user to the main menu.
#If the input does not match anything (see the else statement) then we clear the screen
#and ask for their input again by calling search_submenu.




 def entry_submenu(entry)
      # #16
      puts "n - next entry"
      puts "d - delete entry"
      puts "e - edit this entry"
      puts "m - return to main menu"

      # #17
      selection = gets.chomp

      case selection
      # #18
        when "n"
      # #19
        when "d"
          ##7
          delete_entry(entry)

        when "e"
          ##8
          edit_entry(entry)
          entry_submenu(entry)
#At #7, when a user is viewing the submenu and they press d, we call delete_entry.
##After the entry is deleted, control will return to view_all_entries and the next entry will be displayed.
#At #8, we call edit_entry when a user presses e. We then display a sub-menu with entry_submenu for the entry under edit.

        when "m"
          system "clear"
          main_menu
        else
          system "clear"
          puts "#{selection} is not a valid input"
          entry_submenu(entry)
      end
    end


end





##At #1, include AddressBook using require_relative. At #2, display the main menu options to the command line.
## #3, retrieve user input from the command line using gets. gets reads the next line from standard input.
##At #7, use a case statement operator to determine the proper response to the user's input. At #8, terminate
##the program using exit(0). 0 signals the program is exiting without an error. At #9, use an else to catch
##invalid user input and prompt the user to retry. At #10, stub the rest of the methods called in main_menu.

#16, display the submenu options. #17, chomp removes any trailing whitespace from the string gets returns.
## This is necessary because "m " or "m\n" won't match "m". #18, when the user asks to see the next entry, we can
##do nothing and control will be returned to view_all_entries. At #19, we'll handle deleting and editing in
##another checkpoint, for now the user will be shown the next entry. At #20, we return the user to the main
##menu.
