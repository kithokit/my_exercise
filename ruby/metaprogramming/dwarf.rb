# dwarf.rb
class Dwarf
  include Comparable

  def initialize(name, age, beard_strength)
    @name           = name
    @age            = age
    @beard_strength = beard_strength
  end

  attr_reader :name, :age, :beard_strength
  public    :name
  private   :age
  protected :beard_strength

  # Comparable module will use this comparison method for >, <, ==, etc.
  def <=>(other_dwarf)
    # One dwarf is allowed to call this method on another
    beard_strength <=> other_dwarf.beard_strength
  end

  def greet
    "Lo, I am #{name}, and have mined these #{age} years.\
       My beard is #{beard_strength} strong!"
  end

  def blurt
    # Not allowed to do this: private methods can't have an explicit receiver
    self.age= 6
  end

  private
  def age= (ok)
    ok
  end
end
gloin = Dwarf.new('Gloin', 253, 7)
gimli = Dwarf.new('Gimli', 62,  9)

gloin > gimli         # false
gimli > gloin         # true

gimli.name            # 'Gimli'
#gimli.age             # NoMethodError: private method `age'
                         #called for #<Dwarf:0x007ff552140128>

#gimli.beard_strength # NoMethodError: protected method `beard_strength'
                        #called for #<Dwarf:0x007ff552140128>

gimli.greet          # "Lo, I am Gimli, and have mined these 62 years.\
                        #   My beard is 9 strong!"

puts gimli.blurt          # private method `age' called for #<Dwarf:0x007ff552140128>
