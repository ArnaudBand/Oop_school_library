require './person_class/person'
require './decorate_class/capital'
require './decorate_class/trim'

person = Person.new(22, 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmedperson = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmedperson.correct_name
