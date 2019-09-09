puts "making users"
User.create!(username: "Ryan", password: "1234567")
User.create!(username: "Darrow", password: "7654321")
User.create!(username: "Jason", password: "123456393")
User.create!(username: "Dan", password: "1234567")
User.create!(username: "Belinda", password: "1234567")


player_string = RestClient.get("https://balldontlie.io/api/v1/players")
player_hash = JSON.parse(player_string)

team_string = RestClient.get('https://balldontlie.io/api/v1/teams')
team_hash = JSON.parse(team_string)


team_hash["data"].each do |hash|
    Team.create!(
        full_name: hash["full_name"],
        city: hash["city"],
        conference: hash["conference"],
        division: hash["division"],
        abv: hash["abbreviation"]
    )

end
    
player_hash["data"].each do |hash|
    Player.create!(
        f_name: hash["first_name"],
        l_name: hash["last_name"],
        position: hash["position"],
        weight: hash["weight_pounds"],
        team_id: hash["team"]["id"]
    )
end
        
Follow.create!(player_id: 1, user_id: 1, favorite: true)
Follow.create!(player_id: 2, user_id: 2)
Follow.create!(player_id: 3, user_id: 3, favorite: true)
Follow.create!(player_id: 5, user_id: 4)
Follow.create!(player_id: 5, user_id: 5)
Follow.create!(player_id: 10, user_id: 1, favorite: true)
Follow.create!(player_id: 15, user_id: 2)
Follow.create!(player_id: 20, user_id: 3)
Follow.create!(player_id: 3, user_id: 4, favorite: true)
Follow.create!(player_id: 17, user_id: 5)


# puts "making teams"
# Team.create!(full_name: "Da Cavs", city: "Cleveland", conference: "who knows", division: "idc", abv: "sure")
# Team.create!(full_name: "Da Heat", city: "Miami", conference: "who cares", division: "idk", abv: "nope")
# Team.create!(full_name: "Da Nets", city: "NYC babeeeeeee", conference: "YOU KNOW WHAT IT IS", division: "WOOOOOOO", abv: "NYC")

# puts "making players"
# Player.create!(f_name: "Lebron", l_name: "James", position: "SF", weight: 250, age: 12, team_id: 1)
# Player.create!(f_name: "Kyrie", l_name: "Irving", position: "PG", weight: 160, age: 13, team_id: 2)
# Player.create!(f_name: "Russel", l_name: "Westbrook", position: "PG", weight: 180, age: 9, team_id: 3)
# Player.create!(f_name: "Paul", l_name: "George", position: "SF", weight: 200, age: 4, team_id: 1)
# Player.create!(f_name: "Andre", l_name: "Igoudala", position: "C", weight: 20, age: 120, team_id: 2)