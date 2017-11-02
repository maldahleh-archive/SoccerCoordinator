/*
     Treehouse iOS Techdegree Project #1
     Author: Mohammed Al-Dahleh
 */

/*
     Dictionary of the three team's practice times
 */
let practiceTimes = [
    "dragons": "March 17, 1 PM",
    "sharks": "March 17, 3 PM",
    "raptors": "March 18, 1 PM"
]

/*
     Dictionary to include all the possible players that will be assigned to teams
 */
let players = [
    ["name": "Joe Smith", "height": 42, "experience": true, "guardians": "Jim and Jan Smith"],
    ["name": "Jill Tanner", "height": 36, "experience": true, "guardians": "Clara Tanner"],
    ["name": "Bill Bon", "height": 43, "experience": true, "guardians": "Sara and Jenny Bon"],
    ["name": "Eva Gordon", "height": 45, "experience": false, "guardians": "Wendy and Mike Gordon"],
    ["name": "Matt Gill", "height": 40, "experience": false, "guardians": "Charles and Sylvia Gill"],
    ["name": "Kimmy Stein", "height": 41, "experience": false, "guardians": "Bill and Hillary Stein"],
    ["name": "Sammy Adams", "height": 45, "experience": false, "guardians": "Jeff Adams"],
    ["name": "Karl Saygan", "height": 42, "experience": true, "guardians": "Heather Bledsoe"],
    ["name": "Suzane Greenberg", "height": 44, "experience": true, "guardians": "Henrietta Dumas"],
    ["name": "Sal Dali", "height": 41, "experience": false, "guardians": "Gala Dali"],
    ["name": "Joe Kavalier", "height": 39, "experience": false, "guardians": "Sam and Elaine Kavalier"],
    ["name": "Ben Finkelstein", "height": 44, "experience": false, "guardians": "Aaron and Jill Finkelstein"],
    ["name": "Diego Soto", "height": 41, "experience": true, "guardians": "Robin and Sarika Soto"],
    ["name": "Chloe Alaska", "height": 47, "experience": false, "guardians": "David and Jamie Alaska"],
    ["name": "Arnold Willis", "height": 43, "experience": false, "guardians": "Claire Willis"],
    ["name": "Phillip Helm", "height": 44, "experience": true, "guardians": "Thomas Helm and Eva Jones"],
    ["name": "Les Clay", "height": 42, "experience": true, "guardians": "Wynonna Brown"],
    ["name": "Herschel Krustofski", "height": 45, "experience": true, "guardians": "Hyman and Rachel Krustofski"]
]

/*
     Lists used to sort players into experienced and unexperienced sets
 */
var experiencedPlayers: [[String: Any]] = []
var unexperiencedPlayers: [[String: Any]] = []

/*
     Lists for each independent team
 */
var teamSharks: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []

/*
     List that stores all the letters
 */
var letters: [String] = []

/*
     Function that when called will sort all players into either experienced or unexperienced categories
 */
func sortPlayers() {
    for player in players {
        if player["experience"] as! Bool {
            experiencedPlayers.append(player)
        } else {
            unexperiencedPlayers.append(player)
        }
    }
}

/*
     Function that assigns all the experienced players, ensuring an equal balance on all three teams
 */
func sortExperiencedPlayers() {
    for experiencedPlayer in experiencedPlayers {
        if teamSharks.count <= teamDragons.count && teamSharks.count <= teamRaptors.count {
            teamSharks.append(experiencedPlayer)
        } else if teamDragons.count <= teamRaptors.count {
            teamDragons.append(experiencedPlayer)
        } else {
            teamRaptors.append(experiencedPlayer)
        }
    }
}

/*
     Function that assigns all the unexperienced players to teams
 */
func sortUnexperiencedPlayers() {
    for unexperiencedPlayer in unexperiencedPlayers {
        if teamSharks.count <= teamDragons.count && teamSharks.count <= teamRaptors.count {
            teamSharks.append(unexperiencedPlayer)
        } else if teamDragons.count <= teamRaptors.count {
            teamDragons.append(unexperiencedPlayer)
        } else {
            teamRaptors.append(unexperiencedPlayer)
        }
    }
}

/*
     Function that generates and stores a letter
 */
func generateLetterFor(playerData player: [String: Any], team: String) {
    let guardianNames = player["guardians"] as! String
    let playerName = player["name"] as! String
    let practiceDate = practiceTimes[team]!
    
    let letter = "Dear \(guardianNames),\n Your child, \(playerName) was assigned to the \(team). Their first practice will happen on \(practiceDate)."
    letters.append(letter)
    
    print(letter)
}

/*
     Function that handles all the letters for every team
 */
func handleLetters() {
    for player in teamSharks {
        generateLetterFor(playerData: player, team: "sharks")
    }
    
    for player in teamDragons {
        generateLetterFor(playerData: player, team: "dragons")
    }
    
    for player in teamRaptors {
        generateLetterFor(playerData: player, team: "raptors")
    }
}

/*
     Run the program
 */
sortPlayers()
sortExperiencedPlayers()
sortUnexperiencedPlayers()
    
handleLetters()
