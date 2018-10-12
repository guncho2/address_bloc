

class Entry

    #These must be accessors since we mutate them
    attr_accessor :name, :phone_number, :email
    ##initialize method that takes three arguments
    def initialize(name, phone_number, email)
        ## set the attributes
        @name = name
        @phone_number = phone_number
        @email = email
        end
    #defined to_s
    # #7
    def to_s
        "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
    end

end





##At #7, we create the string we want. The \n character is the newline character. It prints a newline to the console.
