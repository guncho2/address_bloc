require_relative '../models/address_book'

RSpec.describe AddressBook do
  ##1
  let (:book) { AddressBook.new }
  # #6
     def check_entry(entry, expected_name, expected_number, expected_email)
       expect(entry.name).to eq expected_name
       expect(entry.phone_number).to eq expected_number
       expect(entry.email).to eq expected_email
     end

     describe "#nuke" do
       it "should delete all entries" do
         book.add_entry("Ada Lovelace", "010.012.1815", "augusta_king@lovelace.com")
         book.add_entry("Ada Lovelace", "010.012.1815", "augusta_king@lovelace.com")
         book.add_entry("Ada Lovelace", "010.012.1815", "augusta_king@lovelace.com")

         book.nuke
         expect(book.entries.size).to eq 0

       end
     end

  ##2
    describe "attributes" do
        it "responds to entries" do
        ##    book = AddressBook.new
            expect(book).to respond_to(:entries)
            end

        ## AddressBook should initialize entries as an empty array so that it's ready to be used.
        ##Add a couple new tests to confirm this behavior:

        it "initializes entries as an array" do
  ##          book = AddressBook.new
            expect(book.entries).to be_an(Array)
        end

        it "initializes entries as empty" do
  ##          book = AddressBook.new
            expect(book.entries.size).to eq(0)
        end
      end

  ## remove method

  describe "#remove_entry"  do
    it "it remove an entry using the name, phone_number and email" do
    ##  book = AddressBook.new
      book.add_entry("Eduardo Lowensohn", "222.455.1223", "eduardo.lowensohn@lowensohn.com")

       name = "Ada Lovelace"
       phone_number = "010.012.1815"
       email_address = "augusta.king@lovelace.com"
       book.add_entry(name, phone_number, email_address)

       expect(book.entries.size).to eq 2
       book.remove_entry(name, phone_number, email_address)
       expect(book.entries.size).to eq 1
       expect(book.entries.first.name).to eq("Eduardo Lowensohn")

     end
   end


   ##method, add_entry, to update and add items to that array our entries array

  describe "#add_entry" do
      it "adds only one entry to the address book" do
  ##        book = AddressBook.new
          book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
          expect(book.entries.size).to eq(1)
          end

      it "adds correct information to entries" do
    ##      book = AddressBook.new
          book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
          new_entry = book.entries[0]

          expect(new_entry.name).to eq('Ada Lovelace')
          expect(new_entry.phone_number).to eq('010.012.1815')
          expect(new_entry.email).to eq('augusta.king@lovelace.com')
          end
      end
      ##Test that AddressBook .import_from_csv() method is working as expected
      describe "#import_from_csv" do
        it "import the correct number of entries" do
          ##3
          book.import_from_csv("entries.csv")
          book_size = book.entries.size
          ## check the size of the entries on AddressBook
          expect(book_size).to eq 5
        end

      ##4
      it "imports the 1st entry" do
    book.import_from_csv("entries.csv")
    # Check the first entry
    entry_one = book.entries[0]

    # #5
  ##  expect(entry_one.name).to eq "Bill"
  ##  expect(entry_one.phone_number).to eq "555-555-4854"
  ##  expect(entry_one.email).to eq "bill@blocmail.com"
  check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")

  end


it "imports the 2nd entry" do
  book.import_from_csv("entries.csv")
  #Check the second entry
  entry_two = book.entries[1]
##  expect(entry_two.name).to eq "Bob"
##  expect(entry_two.phone_number).to eq "555-555-5415"
##  expect(entry_two.email).to eq "bob@blocmail.com"
check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")

end


     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
  ##     expect(entry_three.name).to eq "Joe"
  ##     expect(entry_three.phone_number).to eq "555-555-3660"
  ##     expect(entry_three.email).to eq "joe@blocmail.com"
      check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")

     end

     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
##       expect(entry_four.name).to eq  "Sally"
##       expect(entry_four.phone_number).to eq "555-555-4646"
##       expect(entry_four.email).to eq "sally@blocmail.com"
    check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")

     end

     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
  ##     expect(entry_five.name).to eq "Sussie"
  ##     expect(entry_five.phone_number).to eq "555-555-2036"
  ##     expect(entry_five.email).to eq "sussie@blocmail.com"
  check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")

     end
   end
   describe "#import_from_csv_2" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries_2.csv")
      book_size = book.entries.size

      expect(book_size).to eq 3
    end

    it "imports from first entry" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[1]
      check_entry(entry_one, "Eduardo", "555-300-7509", "eduardo@mail.com")
    end

    it "imports from second entry" do
      book.import_from_csv("entries_2.csv")
      entry_two = book.entries[2]
      check_entry(entry_two, "Isaac", "555-249-3321", "isaac@mail.com")
    end

    it "imports from third entry" do
      book.import_from_csv("entries_2.csv")
      entry_three = book.entries[0]
      check_entry(entry_three, "Carol", "555-223-4343", "carol@mail.com")
    end
  end #describe "#import_from_csv_2" do

#Test the binary_search method

describe "#binary_search" do
  it "Search AddressBook for a non-existent entry" do
    book.import_from_csv("entries.csv")
    entry = book.binary_search("Dan")
    expect(entry).to be_nil
  end

  it "searches AddressBook for Bill" do
  book.import_from_csv("entries.csv")
  entry = book.binary_search("Bill")
  expect(entry).to be_a Entry
  check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
end

it "searches AddressBook for Bob" do
     book.import_from_csv("entries.csv")
     entry = book.binary_search("Bob")
     expect(entry).to be_a Entry
     check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
   end

   it "searches AddressBook for Joe" do
     book.import_from_csv("entries.csv")
     entry = book.binary_search("Joe")
     expect(entry).to be_a Entry
     check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
   end

   it "searches AddressBook for Sally" do
     book.import_from_csv("entries.csv")
     entry = book.binary_search("Sally")
     expect(entry).to be_a Entry
     check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
   end

   it "searches AddressBook for Sussie" do
     book.import_from_csv("entries.csv")
     entry = book.binary_search("Sussie")
     expect(entry).to be_a Entry
     check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
   end
   it "searches AddressBook for Billy" do
          book.import_from_csv("entries.csv")
          entry = book.binary_search("Billy")
          expect(entry).to be_nil
        end

end
#Test the Iterative search  method

describe "#iterative_search" do
  it "Search AddressBook for a non-existent entry" do
    book.import_from_csv("entries.csv")
    entry = book.iterative_search("Dan")
    expect(entry).to be_nil
  end

  it "searches AddressBook for Bill" do
  book.import_from_csv("entries.csv")
  entry = book.iterative_search("Bill")
  expect(entry).to be_a Entry
  check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
end

it "searches AddressBook for Bob" do
     book.import_from_csv("entries.csv")
     entry = book.iterative_search("Bob")
     expect(entry).to be_a Entry
     check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
   end

   it "searches AddressBook for Joe" do
     book.import_from_csv("entries.csv")
     entry = book.iterative_search("Joe")
     expect(entry).to be_a Entry
     check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
   end

   it "searches AddressBook for Sally" do
     book.import_from_csv("entries.csv")
     entry = book.iterative_search("Sally")
     expect(entry).to be_a Entry
     check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
   end

   it "searches AddressBook for Sussie" do
     book.import_from_csv("entries.csv")
     entry = book.iterative_search("Sussie")
     expect(entry).to be_a Entry
     check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
   end
   it "searches AddressBook for Billy" do
          book.import_from_csv("entries.csv")
          entry = book.iterative_search("Billy")
          expect(entry).to be_nil
        end

end

  end


##At #1, we create new instance of the AddressBook model and assign it to the
##variable named book using the let syntax provided by RSpec.This lets us use book in all our tests,
## removing the duplication of having to instantiate a new AddressBook for each test.

##At #2, we see describe and it statements which are an RSpec paradigm to explain what we are
##testing. it explains the functionality of the method we're testing in a human readable form.
##RSpec will take the content from describe and it and output them nicely to the command line when we
## execute the test. Read more about the differences between them.

##At #3, after the describe and it statements, we call the import_from_csv method on the book object
## which is of type AddressBook (our data model). We pass import_from_csv the string entries.csv as a parameter.
##CSV files are a fairly typical way of dealing with data and you can read more about them here. On the
## next line we reference the AddressBook.entries variable to get its size.This variable will be an array.
## Next, we save the size of the AddressBook.entries to our local variable book_size.

##At #4, we access the first entry in the array of entries that our AddressBook stores.
##At #5, we've added three expects to verify that the first entry has the name "Bill", the phone number "555-555-4854",
## and the email address "bill@blocmail.com". If we run this test, it will still fail.

##At #6, we create a helper method named check_entry which consolidates the redundant code. We can now pass in
##the particular name, number, and email address we want into this reusable helper method. We have our basic tests
##set up







##AddressBook needs an attribute to hold the array of entries. The entries array will store entries.
## It also provides an easy way to add, remove, and count entries.
