# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "rosh")
User.create(username: "charlie_b")

Subject.create(name: "Brewing")
Subject.create(name: "Geometry")
Subject.create(name: "Organic Chemistry")

Flashcard.create(
  term: "Square",
  definition: "a rectangle having all four sides of equal length",
  user_id: 1,
  category_id: 2
)
Flashcard.create(
  term: "Vertex",
  definition: "the intersection point of two sides of a plane figure",
  user_id: 1,
  category_id: 1
)
Flashcard.create(
  term: "Double Bond",
  definition: "a form of bonding in which two atoms share two pairs of valence electrons. Carbon is also capable of single bonds and triple bonds",
  user_id: 1,
  category_id: 3
)
Flashcard.create(
  term: "Hydrocarbon",
  definition: "any chemical compound whose molecules are made up of nothing but carbon and hydrogen atoms",
  user_id: 1,
  category_id: 3
)
Flashcard.create(
  term: "carageenans",
  definition: "extracts of marine algae (seaweeds) used in the brewing of some beers to remove materials that could potentially cause hazes in the finished beers",
  user_id: 1,
  category_id: 1
)
Flashcard.create(
  term: "mashing",
  definition: "the start of the brewing process, where crushed grains are mixed with water to form a porridge-like mixture call the 'mash'. Starches are transformed to sugars. Proteins and other materials are made soluble.",
  user_id: 1,
  category_id: 1
)
Flashcard.create(
  term: "hefeweizen",
  definition: "aka 'weissbier'; classical wheat beer of Bavaria. Wheat-based beer that is usually packaged unfiltered with plenty of yeast turbidity in the finished beer. Law requires 60-70% malted wheat, rest of the grist can be malted barley.",
  user_id: 1,
  category_id: 1
)
