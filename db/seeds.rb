michael = User.create(name: "Michael", email: "m@me.com", password_digest: "password")
kelley = User.create(name: "Kelley", email: "k@me.com", password_digest: "password")
pat = User.create(name: "Pat", email: "p@me.com", password_digest: "password")

Destination.create(
    city: "Florence",
    state: "",
    country: "Italy",
    trip_description: "Wonderful trip to visit my best friend.",
    slept_at: "airbnb",
    slept_details: "steps away from duomo",
    restaurant_fav: "Osteria della tre panche",
    restaurant_details: "three tables, truffles, truffles, truffles!",
    attraction_fav: "San Miniato",
    attraction_details: "perfect walk for sunset",
    recommendations: "walk around the first day with no plans!", 
    user_id: michael.id)

Destination.create(
    city: "Naples",
    state: "Florida",
    country: "United States",
    trip_description: "I live here!",
    slept_at: "My Place",
    slept_details: "Pool and golf access, 1 mile from the beach",
    restaurant_fav: "Mercato",
    restaurant_details: "half price drinks and apps during happy hour",
    attraction_fav: "Clam Pass",
    attraction_details: "Best Shell Searching",
    recommendations: "Sit back and relax", 
    user_id: kelley.id)

Destination.create(
    city: "Harbor Springs",
    state: "Michigan",
    country: "United States",
    trip_description: "Relaxing on Lake Michigan",
    slept_at: "Woods End",
    slept_details: "Quiet retreat on Lake Pickeral, minutes from town",
    restaurant_fav: "Legs Inn",
    restaurant_details: "classic homestyle",
    attraction_fav: "Good Hart",
    attraction_details: "Petoskey stones along the shore",
    recommendations: "Sit back and enjoy nature!", 
    user_id: pat.id)