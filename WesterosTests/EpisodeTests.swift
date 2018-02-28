//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by Javi on 25/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import XCTest

@testable import Westeros
class EpisodeTests: XCTestCase {

    var season1: Season!
    var episode1x1: Episode!
    var episode1x2: Episode!
    
    override func setUp() {
        super.setUp()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        var dateEpisode = formatter.date(from: "2011/04/17")
        
        season1 = Season(name: "Game of Thrones Season 1", releaseDate: dateEpisode!)
        episode1x1 = Episode(title: "Winter Is Coming", emisionDate: dateEpisode!, season: season1,resumen: )
        dateEpisode = formatter.date(from: "2011/04/24")
        episode1x2 = Episode(title: "The Kingsroad", emisionDate: dateEpisode!, season: season1)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEpisodeExistence(){
        
        XCTAssertNotNil(episode1x1)
        XCTAssertNotNil(episode1x2)
    }
    
    func testEpisodeEquality(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let dateEpisode = formatter.date(from: "2011/04/17")
        
        //Identidad
        XCTAssertEqual(episode1x1, episode1x1)
        
        //Igualdad
        let episode1x1Bis = Episode(title: "Winter Is Coming", emisionDate: dateEpisode!, season: season1)
        XCTAssertEqual(episode1x1Bis, episode1x1)
        
        //Desigualdad
        XCTAssertNotEqual(episode1x1, episode1x2)
    }
    
    func testEpisodeComparison(){
        XCTAssertLessThan(episode1x2, episode1x1)
    }
}
