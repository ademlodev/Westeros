//
//  Repository.swift
//  Westeros
//
//  Created by Javi on 13/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

final class Repository{
    static let local = LocalFactory()
    
}

protocol HouseFactory {
    typealias FilterHouse = (House) -> Bool
    typealias FilterSeason = (Season) -> Bool
    
    var houses: [House] {get}
    var seasons: [Season] {get}
    func house(named: String) -> House?
    func houses(filteredBy: FilterHouse) -> [House]
    func season(named: String) -> Season?
    func seasons(filteredBy: FilterSeason) -> [Season]
}

final class LocalFactory: HouseFactory {
    
    var houses: [House]{
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Lobo Hueargo")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Leon Rampante")
        let targaryenSigil = Sigil(image: UIImage(named:"targaryenSmall.jpg")!, description: "Dragón Tricéfalo")
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")! )
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        let robb = Person(name: "Robb",alias:"El joven lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyiron = Person(name: "Tyrion", alias:"El enano", house: lannisterHouse)
        let jaime = Person(name:"Jaime", alias: "El Matarreyes", house: targaryenHouse)
        let dani = Person(name:"Daenerys", alias: "Madre de dragones", house: targaryenHouse)
        
        starkHouse.add(person: arya)
        starkHouse.add(person: robb)
        lannisterHouse.add(person: tyiron)
        targaryenHouse.add(person: jaime)
        targaryenHouse.add(person: dani)
        
        return [starkHouse,lannisterHouse,targaryenHouse].sorted()
    }
    
    var seasons: [Season]{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        var dateEpisode = formatter.date(from: "2011/04/17")
        
        let season1 = Season(name: "Game of Thrones Season 1", releaseDate: dateEpisode!)
        let episode1x1 = Episode(title: "Winter Is Coming", emisionDate: dateEpisode!, season: season1, resumen: "In the Seven Kingdoms of Westeros, a soldier of the ancient Night's Watch order survives an attack by supernatural creatures known as the White Walkers, thought until now to be myth. He rushes to Castle Winterfell, which is ruled by Eddard ,Ned Stark, Warden of the North, who decapitates the soldier for deserting his post.")
        dateEpisode = formatter.date(from: "2011/04/24")
        let episode1x2 = Episode(title: "The Kingsroad", emisionDate: dateEpisode!, season: season1, resumen: "Having accepted his new role as the Hand of the King, Ned leaves Winterfell with his daughters Sansa and Arya, while Catelyn stays behind to tend to Bran. The unconscious Bran is attacked by an assassin, but his direwolf saves him. Catelyn decides to go to King's Landing to tell Ned about the attempt and suspected Lannister involvement.")
        season1.add(episode: episode1x1)
        season1.add(episode: episode1x2)
        
        dateEpisode = formatter.date(from: "2012/04/01")
        let season2 = Season(name: "Game of Thrones Season 2", releaseDate: dateEpisode!)
        let episode2x1 = Episode(title: "The North Remembers", emisionDate: dateEpisode!, season: season2, resumen: )
        dateEpisode = formatter.date(from: "2012/04/08")
        let episode2x2 = Episode(title: "The Night Lands", emisionDate: dateEpisode!, season: season2, resumen: <#String#>)
        season2.add(episode: episode2x1)
        season2.add(episode: episode2x2)
        
        dateEpisode = formatter.date(from: "2013/03/31")
        let season3 = Season(name: "Game of Thrones Season 3", releaseDate: dateEpisode!)
        let episode3x1 = Episode(title: "Valar Dohaeris", emisionDate: dateEpisode!, season: season3, resumen: <#String#>)
        dateEpisode = formatter.date(from: "2013/04/07")
        let episode3x2 = Episode(title: "Dark Wings, Dark Words", emisionDate: dateEpisode!, season: season3, resumen: <#String#>)
        season3.add(episode: episode3x1)
        season3.add(episode: episode3x2)
        
        dateEpisode = formatter.date(from: "2014/04/06")
        let season4 = Season(name: "Game of Thrones Season 4", releaseDate: dateEpisode!)
        let episode4x1 = Episode(title: "Two Swords", emisionDate: dateEpisode!, season: season4, resumen: <#String#>)
        dateEpisode = formatter.date(from: "2014/04/13")
        let episode4x2 = Episode(title: "The Lion and the Rose", emisionDate: dateEpisode!, season: season4, resumen: <#String#>)
        season4.add(episode: episode4x1)
        season4.add(episode: episode4x2)
        
        dateEpisode = formatter.date(from: "2015/04/12")
        let season5 = Season(name: "Game of Thrones Season 5", releaseDate: dateEpisode!)
        let episode5x1 = Episode(title: "The Wars to Come", emisionDate: dateEpisode!, season: season5, resumen: <#String#>)
        dateEpisode = formatter.date(from: "2015/04/19")
        let episode5x2 = Episode(title: "The House of Black and White", emisionDate: dateEpisode!, season: season5, resumen: <#String#>)
        season5.add(episode: episode5x1)
        season5.add(episode: episode5x2)
        
        dateEpisode = formatter.date(from: "2016/04/24")
        let season6 = Season(name: "Game of Thrones Season 6", releaseDate: dateEpisode!)
        let episode6x1 = Episode(title: "The Red Woman", emisionDate: dateEpisode!, season: season6, resumen: <#String#>)
        dateEpisode = formatter.date(from: "2016/05/01")
        let episode6x2 = Episode(title: "Home", emisionDate: dateEpisode!, season: season6, resumen: <#String#>)
        season6.add(episode: episode6x1)
        season6.add(episode: episode6x2)
        
        dateEpisode = formatter.date(from: "2017/07/16")
        let season7 = Season(name: "Game of Thrones Season 7", releaseDate: dateEpisode!)
        let episode7x1 = Episode(title: "Dragonstone", emisionDate: dateEpisode!, season: season7, resumen: <#String#>)
        dateEpisode = formatter.date(from: "2017/07/23")
        let episode7x2 = Episode(title: "Stormborn", emisionDate: dateEpisode!, season: season7, resumen: <#String#>)
        season7.add(episode: episode7x1)
        season7.add(episode: episode7x2)
        
        return [season1,season2,season3,season4,season5,season6,season7].sorted()
    }
    
    func house(named name: String) -> House? {
        let house = houses.filter{ $0.name.uppercased() == name.uppercased() }.first
        return house
    }
    
    func houses(filteredBy: FilterHouse) -> [House] {
        return houses.filter(filteredBy)
    }
    
    func season(named name: String) -> Season? {
        let season = seasons.filter{ $0.name.uppercased() == name.uppercased() }.first
        return season
    }

    func seasons(filteredBy: FilterSeason) -> [Season] {
        return seasons.filter(filteredBy)
    }
}
