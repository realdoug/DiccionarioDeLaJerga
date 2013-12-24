countries_arr = ["Spain", "Colombia", "Peru", "Venezuela", "Ecuador", "Guatemala", "Cuba", "Bolivia",
 "Honduras", "Paraguay", "El Salvador", "Costa Rica", "Panama", "Equatorial Guinea", "Puerto Rico",
"United States", "Canada", "Belize", "Andorra", "Gibraltar",
"Aruba", "Bonaire", "Curacao", "Phillipines"]

countries_arr.each {|country| Country.find_or_create_by(name: country)}