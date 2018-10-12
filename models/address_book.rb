# #8
require_relative 'entry'


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
    end





##To keep entries nicely ordered we'll code add_entry to insert entries in lexicographical order
##At #8, we tell Ruby to load the library named entry.rb relative to address_book.rb's file path using require_relative.
##At #9, we create a variable to store the insertion index. At #10, we compare name with the name of the current
##entry. If name lexicographically proceeds entry.name, we've found the index to insert at. Otherwise we increment
## index and continue comparing with the other entries. At #11, we insert a new entry into entries using the
##calculated `index.
