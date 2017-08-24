require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, blue_aspects|
    blue_aspects.each do |each_blue_aspect, green_properties|
      if each_blue_aspect == :players
        green_properties.each do |each_green_property, blue_accomps|
          if each_green_property == player_name
            return blue_accomps[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, blue_aspects|
    blue_aspects.each do |each_blue_aspect, green_properties|
      if each_blue_aspect == :players
        green_properties.each do |each_green_property, blue_accomps|
          if player_name == each_green_property
            return blue_accomps[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, blue_aspects|
    if team_name == blue_aspects[:team_name]
      return blue_aspects[:colors]
    end
  end
end

def team_names
  team_names_array = []
  game_hash.each do |location, blue_aspects|
    if blue_aspects[:team_name]
      team_names_array << blue_aspects[:team_name]
    end
  end
  return team_names_array
end

def player_numbers(team_name)
  numbers_array = []
  game_hash.each do |location, blue_aspects|
    if blue_aspects[:team_name] == team_name
      blue_aspects.each do |each_blue_aspect, green_properties|
        if each_blue_aspect == :players
          green_properties.each do |each_green_property, blue_accomps|
            numbers_array << blue_accomps[:number]
          end
        end
      end
    end
  end
  return numbers_array
end

def player_stats(player_name)
  game_hash.each do |location, blue_aspects|
    blue_aspects.each do |each_blue_aspect, green_properties|
      if each_blue_aspect == :players
        green_properties.each do |each_green_property, blue_accomps|
          if each_green_property == player_name
            return blue_accomps
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_size = 0
  players_rebounds = 0

  game_hash.each do |location, blue_aspects|
    blue_aspects.each do |each_blue_aspect, green_properties|
      if each_blue_aspect == :players
        green_properties.each do |each_green_property, blue_accomps|
          if blue_accomps[:shoe] > biggest_size
            biggest_size = blue_accomps[:shoe]
            players_rebounds = blue_accomps[:rebounds]
          end
        end
      end
    end
  end
  return players_rebounds
end
