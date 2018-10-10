require_relative '../models/entry'
# #1 is the standard first line of an RSpec test file. We are saying that the file is a spec file and that it tests Entry.
RSpec.describe Entry do
    # #2we use describe to give our test structure. In this case, we're using it to communicate that the specs test the Entry attributes.
    describe "attributes" do
        let(:entry) { Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com') }
        ##defining efficient helper methods using let. Instead of creating an entry local variable within each test, let's define an entry method once

        # #3 we separate our individual tests using the it method. Each it represents a unique test.
        it "responds to name" do
        ##     entry = Entry.new('Ada Lovelace', '010.012.1814', 'augusta.king@lovelace.com')

            # #4 each RSpec test ends with one or more expect method, which we use to declare the expectations for the test. If those expectations are met, our test passes, if they are not, it fails.
            expect(entry).to respond_to(:name)
            end

        it "reports its name" do
            ##     entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(entry.name).to eq('Ada Lovelace')
        end


        it "responds to phone number" do
            ##    entry = Entry.new('Ada Lovelace', '010.012.1814', 'augusta.king@lovelace.com')
            expect(entry).to respond_to(:phone_number)
            end


        it "reports its phone_number" do
         ##    entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(entry.phone_number).to eq('010.012.1815')
        end


        it "responds to email" do
        ##     entry = Entry.new('Ada Lovelace', '010.012.1814', 'augusta.king@lovelace.com')
            expect(entry).to respond_to(:email)
            end

        it "reports its email" do
         ##    entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(entry.email).to eq('augusta.king@lovelace.com')
        end
        end
    ##To build the menu we'll need a method to return a string representation of an Entry to_s, short for "(convert) to string"

    # #5
    describe "#to_s" do
        it "prints an entry as a string" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
            # #6
            expect(entry.to_s).to eq(expected_string)
        end
    end


end







##At #5, we use a new describe block to separate the to_s test from the initializer tests. The # in front of to_s indicates that it is an instance method.

##At #6, we use eq to check that to_s returns a string equal to expected_string.
