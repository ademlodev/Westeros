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
        episode1x1 = Episode(title: "Winter Is Coming", emisionDate: dateEpisode!, season: localSeasons)
        dateEpisode = formatter.date(from: "2011/04/24")
        episode1x2 = Episode(title: "The Kingsroad", emisionDate: dateEpisode!, season: localSeasons)
        
        
        dateEpisode = formatter.date(from: "2012/04/01")
        localSeasons2 = Season(name: "Game of Thrones Season 2", releaseDate: dateEpisode!)
        episode2x1 = Episode(title: "The North Remembers", emisionDate: dateEpisode!, season: localSeasons2)
        dateEpisode = formatter.date(from: "2012/04/08")
        episode2x2 = Episode(title: "The Night Lands", emisionDate: dateEpisode!, season: localSeasons2)
        
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
        
        let episode3x1 = Episode(title: "Valar Dohaeris", emisionDate: formatter.date(from: "2013/04/07")!, season: localSeasons2)
        let episode3x2 = Episode(title: "Dark Wings, Dark Words", emisionDate: formatter.date(from: "2013/04/07")!, season: localSeasons2)
        
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
