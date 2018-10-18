# #8
require_relative 'entry'
require "csv"


class AddressBook
  attr_accessor :entries

    ##read-only entries attribute to AddressBook



    def initialize
        @entries = []
    end

    def nuke
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

        def iterative_search(name)
          @entries.each do |entry|
            if entry.name == name
              return entry

            end
          end
          return nil
        end

## Search AddressBook for a specific entry by name
def binary_search(name)
  ##1
  lower = 0
  upper = entries.length - 1

  ##2

  while lower <= upper
    ##3
    mid = (lower + upper) / 2
    mid_name  =  entries[mid].name

    ##4

    if name == mid_name
      return entries[mid]
    elsif name < mid_name
      upper = mid - 1
    elsif name > mid_name
      lower = mid + 1
    end
  end
  ##5
  return nil




end

    end


##At #1, we save the index of the leftmost item in the array in a variable named
##lower, and the index of rightmost item in the array in upper. If we think of the
##array in terms of left-to-right where the leftmost item is the zeroth index and
##the rightmost item is the entries.length-1 index.

##At #2, we loop while our lower index is less than or equal to our upper index.

##At #3, we find the middle index by taking the sum of lower and upper and dividing
##it by two. Ruby will truncate any decimal numbers, so if upper is five and lower
## is zero then mid will get set to two. Then we retrieve the name of the entry at
## the middle index and store it in mid_name.

##At #4, we compare the name that we are searching for, name, to the name of the middle
## index, mid_name. We use the == operator when comparing the names which makes the search case sensitive
##If name is equal to mid_name we've found the name we are looking for so we return the entry at index mid.
##If name is alphabetically before mid_name, then we set upper to mid - 1 because the name must be in the lower half of the array.
##If name is alphabetically after mid_name, then we set lower to mid + 1 because the name must be in the upper half of the array.

##At #5, if we divide and conquer to the point where no match is found, we return nil.


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
