# A collection that automatically calculates the key for any value. This class
# extends Hash, so it includes all its methods, plus #<<.
# For example:
#     class Dog
#       attr_accessor :name
#       def initialize name
#         @name = name
#       end
#     end
#     dogs = AutoHash.new(Dog) do |d|
#       d.name
#     end
#     dogs << Dog.new("Pulgas")
#     dogs << Dog.new("Gijs")
#     dogs << Dog.new("Pulgas") # replaces the previous Pulgas
class AutoHash < Hash

    # Returns the class of the element enforced. Any instance of this class
    # is accepted by the AutoHash.
    attr_reader :element_type

    # The function that automatically determines a key based on a value.
    attr_reader :hash

    # Initializes the AutoHash with a function that gets the hash for any new
    # element added. If element_type is <code>nil</code>, no class is enforced
    # in the #<< method.
    def initialize element_type=nil, &hash
        @element_type = element_type
        @hash = hash
        self
    end

    # If a type is enforced and <code>elem</code> is not an instance of such
    # class (or any subclass), then an exception is raised. Otherwise, the
    # element's automatic hash is calculated based on <code>elem</code> and
    # put in this Hash.
    def << elem
        unless @element_type.nil? or elem.is_a?(@element_type)
            raise TypeError.new("Cannot add element of type #{elem.class}")
        end
        self[@hash.call(elem)] = elem
    end
end
