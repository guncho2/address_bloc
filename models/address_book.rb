# #8
require_relative 'entry'
require "csv"


class AddressBook
  attr_accessor :entries

    ##read-only entries attribute to AddressBook



    def initialize
        @entries = []
    end

    def remove_entry(name, phone, email)
      delete_entry = nil

      @entries.each do |entry|
        if name == entry.name && phone == entry.phone_number && email == entry.email
          delete_entry = entry

        end
    end

    @entries.delete(delete_entry)
  end


    def add_entry(name, phone_number, email)
        # #9
        index = 0
        entries.each do |entry|
            # #10
            if name < entry.name
                break
                end
            index += 1
            end
        # #11


        @entries.insert(index, Entry.new(name, phone_number, email))
        end
##7
        def import_from_csv(file_name)
          # Implementation goes here
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
  # #8
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
        end

    end





##To keep entries nicely ordered we'll code add_entry to insert entries in lexicographical order
##At #8, we tell Ruby to load the library named entry.rb relative to address_book.rb's file path using require_relative.
##At #9, we create a variable to store the insertion index. At #10, we compare name with the name of the current
##entry. If name lexicographically proceeds entry.name, we've found the index to insert at. Otherwise we increment
## index and continue comparing with the other entries. At #11, we insert a new entry into entries using the
##calculated `index.

##At #7, we defined import_from_csv. The method starts by reading the file, using File.read. The file will be in a CSV format.
## We use the CSV class to parse the file. The result of CSV.parse is an object of type CSV::Table.

##At #8, we iterate over the CSV::Table object's rows. On the next line we create a hash for each row.
## We convert each row_hash to an Entry by using the add_entry method which will also add the Entry to the AddressBook's entries.
