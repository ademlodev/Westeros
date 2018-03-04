//
//  SessionTests.swift
//  WesterosTests
//
//  Created by Javi on 24/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import XCTest

@testable import Westeros
class SeasonTests: XCTestCase {

    var localSeasons: Season!
    var localSeasons2: Season!
    
    var episode1x1: Episode!
    var episode1x2: Episode!
    var episode2x1: Episode!
    var episode2x2: Episode!
    
    override func setUp() {
        super.setUp()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        var dateEpisode = formatter.date(from: "2011/04/17")
        
        localSeasons = Season(name: "Game of Thrones Season 1", releaseDate: dateEpisode!)
        episode1x1 = Episode(title: "Winter Is Coming", emisionDate: dateEpisode!, season: localSeasons, resumen: "In the Seven Kingdoms of Westeros, a soldier of the ancient Night's Watch order survives an attack by supernatural creatures known as the White Walkers, thought until now to be myth. He rushes to Castle Winterfell, which is ruled by Eddard ,Ned Stark, Warden of the North, who decapitates the soldier for deserting his post.")
        dateEpisode = formatter.date(from: "2011/04/24")
        episode1x2 = Episode(title: "The Kingsroad", emisionDate: dateEpisode!, season: localSeasons, resumen: "Having accepted his new role as the Hand of the King, Ned leaves Winterfell with his daughters Sansa and Arya, while Catelyn stays behind to tend to Bran. The unconscious Bran is attacked by an assassin, but his direwolf saves him. Catelyn decides to go to King's Landing to tell Ned about the attempt and suspected Lannister involvement.")
        
        
        dateEpisode = formatter.date(from: "2012/04/01")
        localSeasons2 = Season(name: "Game of Thrones Season 2", releaseDate: dateEpisode!)
        episode2x1 = Episode(title: "The North Remembers", emisionDate: dateEpisode!, season: localSeasons2, resumen: "To Cersei's dismay, Tyrion takes up his post as acting Hand at King's Landing. At Dragonstone, Stannis proclaims allegiance to Melisandre's new god and lays public claim to the Iron Throne, revealing Joffrey's bastardy. The latter orders the soldiers to slaughter Robert's bastards, one of whom named Gendry manages to escape King's Landing along with Arya. Having won three victories, Robb offers the Lannisters peace in exchange for the North's independence and Sansa's return, sending Theon to gain the support of Balon, his father, and Catelyn to seek alliance with Renly, who also claims the throne. Beyond the Wall, the Night's Watch finds shelter with Craster and his daughters/wives. In Essos, as her people slowly die in the Red Waste, Daenerys sends out riders for reconnaissance.")
        dateEpisode = formatter.date(from: "2012/04/08")
        episode2x2 = Episode(title: "The Night Lands", emisionDate: dateEpisode!, season: localSeasons2, resumen: "Returning to his home of Pyke after nine years as the Starks' ward, Theon is reunited with his sister, Yara, and Balon, who despises Theon for his Northern ways and intends to win back his crown by force. Cersei rejects Robb's terms and Tyrion exiles Slynt, head of the Gold Cloaks, to the Wall, promoting Bronn to commander of the watch. On the road to the Wall, Arya reveals her true identity to Gendry. North of the Wall, Tarly is approached by one of Craster's daughters, Gilly, who is pregnant and fears for her unborn son; Snow is reluctant to help her despite Tarly's pleas. In the Red Waste, one of the horses returns to Daenerys with the severed head of its rider in a pouch, a message from one of her enemies. In Dragonstone, Davos, Stannis's henchman, recruits the pirate Salladhor Saan to Stannis' side, and the latter has sex with Melisandre to obtain the son his wife cannot give him. Snow discovers that Craster sacrifices his sons to the White Walkers; in response, Craster knocks Snow unconscious.")
        
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSeasonExistence(){
        XCTAssertNotNil(localSeasons)
        XCTAssertNotNil(localSeasons2)
    }
    
    func testEpisodeExixstence(){
        XCTAssertNotNil(episode1x1)
        XCTAssertNotNil(episode1x2)
        XCTAssertNotNil(episode2x1)
        XCTAssertNotNil(episode2x2)
    }
    
    func testAddEpisode(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        XCTAssertEqual(localSeasons.count, 0)
        
        localSeasons.add(episode: episode1x1)
        XCTAssertEqual(localSeasons.count, 1)
        
        localSeasons.add(episode: episode1x2)
        XCTAssertEqual(localSeasons.count, 2)
        
        localSeasons2.add(episode: episode2x1)
        XCTAssertEqual(localSeasons2.count, 1)
        
        localSeasons2.add(episode: episode2x2)
        XCTAssertEqual(localSeasons2.count, 2)
        
        let episode3x1 = Episode(title: "Valar Dohaeris", emisionDate: formatter.date(from: "2013/04/07")!, season: localSeasons2, resumen: "Some of the Night's Watchmen, including Tarly and Mormont, survive the White Walkers' attack and pledge to return to the Wall to warn the Seven Kingdoms. Snow is brought before Rayder, the King beyond the Wall, and pledges his loyalty to the Wildlings. A scarred Tyrion tries to get Casterly Rock from Tywin, who promises other things instead. Margaery engages in charity work with the orphans of King's Landing. Baelish offers to help Sansa escape King's Landing. Ros advises Shae not to trust him. Davos is rescued by Saan, who does not want any more connections with Stannis, and returns to Dragonstone, where he unsuccessfully tries to kill Melisandre, who blames him for convincing Stannis not to let her join the battle, and is imprisoned. In Essos, Daenerys arrives in the city of Astapor to buy an army of brutally-trained slave soldiers, the Unsullied. The warlocks of Qarth attempt to assassinate her, but she is saved by Selmy, the former Kingsguard commander, who pledges his loyalty.")
        let episode3x2 = Episode(title: "Dark Wings, Dark Words", emisionDate: formatter.date(from: "2013/04/07")!, season: localSeasons2, resumen: "Brienne continues escorting Jaime across the Riverlands to King's Landing. He engages her in a fight, which is interrupted by Bolton soldiers. After receiving the news of the sack of Winterfell and the disappearance of Bran and Rickon, Robb diverts his attentions from the war against the Lannisters to attend Catelyn's father's funeral in Riverrun, angering Karstark, who seeks vengeance for his sons who were killed by the Lannisters. Arya, Gendry and Hot Pie also make for Riverrun, but are waylaid by a rebel group, the Brotherhood without Banners, and are taken to an inn, where the captured Clegane reveals Arya's identity. Margaery and her grandmother Olenna, the Queen of Thorns, convince Sansa to tell them about Joffrey's flawed character. Theon is tortured by unknown captors. Bran, Rickon, Osha and Hodor encounter the siblings Jojen and Meera, children of the Stark bannerman Howland. Jojen, who has been sharing Bran's strange dreams, tells him that he is a warg, able to enter the minds of animals.")
        
        localSeasons2.add(episodes: episode3x1, episode3x2)
        XCTAssertEqual(localSeasons2.count, 4)
    }
    
    func testSeasonEquality(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        //Identidad
        XCTAssertEqual(localSeasons, localSeasons)
        
        //Igualdad
        let localSeasonsBis = Season(name: "Game of Thrones Season 1", releaseDate: formatter.date(from: "2011/04/17")!)
        XCTAssertEqual(localSeasons, localSeasonsBis)
        
        //Desigualdad
        XCTAssertNotEqual(localSeasons, localSeasons2)
    }
    
    func testHashable(){
        XCTAssertNotNil(localSeasons.hashValue)
    }
    
    func testHouseComparison(){
        XCTAssertLessThan(localSeasons, localSeasons2)
    }
    
}
