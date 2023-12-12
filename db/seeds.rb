# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# User.create!([{ email: "user1@user.com", password: "password", organization_id: 1 }, { email: "user2@user.com", password: "password", organization_id: 2 }])
# Organization.create!([{ name: "The League" }, { name: "The League 2" }])
# Season.create!([{ name: "Season 1", start_date: "2021-01-01", end_date: "2021-12-31", organization_id: 1 },
#                 { name: "Season 2", start_date: "2022-01-01", end_date: "2022-12-31", organization_id: 1 }])
# Round.create!([{ name: "Round 1", start_date: "2021-01-01", end_date: "2021-01-31", season_id: 1 },
#                { name: "Round 2", start_date: "2021-02-01", end_date: "2021-02-28", season_id: 1 }])
# Match.create!([{ name: "Match 1", start_date: "2021-01-01", end_date: "2021-01-31", round_id: 1, team1_id: 1, team2_id: 2, team1_score: 1, team2_score: 2 },
#                { name: "Match 2", start_date: "2021-02-01", end_date: "2021-02-28", round_id: 1, team1_id: 1, team2_id: 2, team1_score: 1, team2_score: 2 }])
# Player.create!([{ name: "Player 1", organization_id: 1, admin: false, user_id: 1 }, { name: "Player 2", organization_id: 2, admin: false, user_id: 2 }])
# Team.create!([{ name: "Team 1", organization_id: 1, color: "green" }, { name: "Team 2", organization_id: 2, color: "yellow" }])
# TeamPlayer.create!([{ team_id: 1, player_id: 1 }, { team_id: 2, player_id: 2 }])

# db/seeds.rb

# Crear algunas organizaciones
organization1 = Organization.create(name: "Organización A")
organization2 = Organization.create(name: "Organización B")
organization3 = Organization.create(name: "Organización C")

# Crear algunas temporadas (seasons)
season1 = Season.create(name: "Temporada 1", start_date: "2023-01-01", end_date: "2024-01-02", organization: organization1)
season2 = Season.create(name: "Temporada 2", start_date: "2023-02-01", end_date: "2024-02-02", organization: organization2)
season3 = Season.create(name: "Temporada 3", start_date: "2023-03-01", end_date: "2025-03-02", organization: organization3)
season4 = Season.create(name: "Temporada 4", start_date: "2023-04-01", end_date: "2023-09-09", organization: organization3)

# Crear algunas rondas (rounds)
round1 = Round.create(name: "Ronda 1", start_date: "2024-01-01", end_date: "2024-02-01", season: season1)
round2 = Round.create(name: "Ronda 2", start_date: "2024-02-01", end_date: "2024-03-02", season: season2)
round3 = Round.create(name: "Ronda 3", start_date: "2024-03-01", end_date: "2024-03-02", season: season3)
round4 = Round.create(name: "Ronda 4", start_date: "2024-04-01", end_date: "2024-04-02", season: season2)
round5 = Round.create(name: "Ronda 5", start_date: "2024-03-01", end_date: "2024-03-02", season: season3)
round6 = Round.create(name: "Ronda 6", start_date: "2024-04-01", end_date: "2024-04-02", season: season4)
Round.create(name: "Ronda 7", start_date: "2023-05-01", end_date: "2023-05-02", season: season4)

# Crear algunos usuarios
user1 = User.create(email: "usuario1@example.com", password: "password123")
user2 = User.create(email: "usuario2@example.com", password: "password456")
user3 = User.create(email: "usuario3@example.com", password: "password123")
user4 = User.create(email: "usuario4@example.com", password: "password456")
user5 = User.create(email: "usuario5@example.com", password: "password123")
user6 = User.create(email: "usuario6@example.com", password: "password456")
user7 = User.create(email: "usuario7@example.com", password: "password123")
user8 = User.create(email: "usuario8@example.com", password: "password456")
user9 = User.create(email: "usuario9@example.com", password: "password123")
user10 = User.create(email: "usuario10@example.com", password: "password456")
user11 = User.create(email: "usuario11@example.com", password: "password123")
user12 = User.create(email: "usuario12@example.com", password: "password456")
User.create(email: "admin@admin.com", password: "123456", admin: true)

# Crear algunos jugadores asociados a organizaciones
player1 = Player.create(user: user1, organization: organization1, admin: true)
player2 = Player.create(user: user2, organization: organization2, admin: false)
player3 = Player.create(user: user3, organization: organization3, admin: true)
player4 = Player.create(user: user4, organization: organization3, admin: false)
player5 = Player.create(user: user5, organization: organization2, admin: true)
player6 = Player.create(user: user6, organization: organization1, admin: false)
player7 = Player.create(user: user7, organization: organization3, admin: true)
player8 = Player.create(user: user8, organization: organization2, admin: false)
player9 = Player.create(user: user9, organization: organization3, admin: true)
player10 = Player.create(user: user10, organization: organization2, admin: false)
player11 = Player.create(user: user11, organization: organization3, admin: true)
player12 = Player.create(user: user12, organization: organization2, admin: false)

# Crear algunos partidos (matches)
match1 = Match.create(start_time: "2023-01-01", end_time: "2023-01-02", round: round1)
match2 = Match.create(start_time: "2023-01-01", end_time: "2023-01-02", round: round2)
match3 = Match.create(start_time: "2023-01-01", end_time: "2023-01-02", round: round3)
match4 = Match.create(start_time: "2023-01-01", end_time: "2023-01-02", round: round4)
match5 = Match.create(start_time: "2023-01-01", end_time: "2023-01-02", round: round5)
match6 = Match.create(start_time: "2023-01-01", end_time: "2023-01-02", round: round6)

# Crear algunas posiciones de equipos (teams)
team1 = Team.create(name: "Equipo A", color: "Rojo", score: 1, match: match1)
team2 = Team.create(name: "Equipo B", color: "Azul", score: 3, match: match2)
team3 = Team.create(name: "Equipo C", color: "Verde", score: 2, match: match3)
team4 = Team.create(name: "Equipo D", color: "Amarillo", score: 4, match: match4)
team5 = Team.create(name: "Equipo E", color: "Naranja", score: 5, match: match5)
team6 = Team.create(name: "Equipo F", color: "Morado", score: 7, match: match6)
team7 = Team.create(name: "Equipo G", color: "Rojo", score: 6, match: match1)
team8 = Team.create(name: "Equipo H", color: "Azul", score: 8, match: match2)
team9 = Team.create(name: "Equipo I", color: "Verde", score: 1, match: match3)
team10 = Team.create(name: "Equipo J", color: "Amarillo", score: 4, match: match4)
team11 = Team.create(name: "Equipo K", color: "Naranja", score: 5, match: match5)
team12 = Team.create(name: "Equipo L", color: "Morado", score: 1, match: match6)

# Asociar jugadores a equipos
TeamPlayer.create(team: team1, player: player1)
TeamPlayer.create(team: team2, player: player2)
TeamPlayer.create(team: team3, player: player3)
TeamPlayer.create(team: team4, player: player4)
TeamPlayer.create(team: team5, player: player5)
TeamPlayer.create(team: team6, player: player6)
TeamPlayer.create(team: team7, player: player7)
TeamPlayer.create(team: team8, player: player8)
TeamPlayer.create(team: team9, player: player9)
TeamPlayer.create(team: team10, player: player10)
TeamPlayer.create(team: team11, player: player11)
TeamPlayer.create(team: team12, player: player12)

puts "¡Seeds generados exitosamente!"
