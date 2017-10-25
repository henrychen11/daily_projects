# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
CatRentalRequest.destroy_all

cat1 = Cat.new(birth_date: "2000-10-10", color: "Brown", name: "Apple", sex: "M", description: "Epic description for the cat")
cat2 = Cat.new(birth_date: "2002-10-10", color: "Brown", name: "Peanut", sex: "M", description: "Epic description for the cat")
cat3 = Cat.new(birth_date: "2004-10-10", color: "Grey", name: "Lemon", sex: "F", description: "Epic description for the cat")
cat4 = Cat.new(birth_date: "2006-10-10", color: "Grey", name: "Pear", sex: "F", description: "Epic description for the cat")
cat5 = Cat.new(birth_date: "2008-10-10", color: "Yellow", name: "Watermellon", sex: "M", description: "Epic description for the cat")
cat6 = Cat.new(birth_date: "2008-10-10", color: "Yellow", name: "Grape", sex: "M", description: "Epic description for the cat")

cat1.save
cat2.save
cat3.save
cat4.save
cat5.save
cat6.save

# rental1 = CatRentalRequest.new(cat_id: 1, start_date: '1-1-2011', end_date: '2-1-2011').save
# rental2 = CatRentalRequest.new(cat_id: 2, start_date: '1-15-2011', end_date: '3-1-2011').save
# rental3 = CatRentalRequest.new(cat_id: 3, start_date: '3-2-2011', end_date: '4-1-2011').save
# rental4 = CatRentalRequest.new(cat_id: 4, start_date: '5-1-2011', end_date: '5-30-2011').save
# rental5 = CatRentalRequest.new(cat_id: 5, start_date: '5-15-2011', end_date: '6-1-2011').save

# debugger

rental1 = CatRentalRequest.new(cat_id: cat1.id, start_date: '2011-1-1'  , end_date: '2011-1-30', status: 'APPROVED')
rental2 = CatRentalRequest.new(cat_id: cat1.id, start_date: '2011-1-15' , end_date: '2011-2-15', status: 'APPROVED')
rental3 = CatRentalRequest.new(cat_id: cat1.id, start_date: '2011-3-1'  , end_date: '2011-3-15')
rental4 = CatRentalRequest.new(cat_id: cat1.id, start_date: '2011-3-2'  , end_date: '2011-4-30')
rental5 = CatRentalRequest.new(cat_id: cat1.id, start_date: '2011-4-15' , end_date: '2011-5-30')
# debugger
rental1.save
rental2.save
rental3.save
rental4.save
rental5.save
