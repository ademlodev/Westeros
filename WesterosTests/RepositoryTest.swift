//
//  RepositoryTest.swift
//  WesterosTests
//
//  Created by Javi on 13/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import XCTest

@testable import Westeros
class RepositoryTest: XCTestCase {
    
    var localHouses: [House]!
    var localSeasons: [Season]!
    
    override func setUp() {
        super.setUp()
        localHouses = Repository.local.houses
        localSeasons = Repository.local.seasons
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalRepositoryCreation(){
        let local = Repository.local
        XCTAssertNotNil(local)
    }
    
    func testLocalRepositoryHouseCreation(){
        
        XCTAssertNotNil(localHouses)
        XCTAssertEqual(localHouses.count, 3)
        XCTAssertNotNil(localSeasons)
        XCTAssertEqual(localSeasons.count, 7)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses(){
        XCTAssertEqual(localHouses, localHouses.sorted())
        XCTAssertEqual(localSeasons, localSeasons.sorted())
    }
    
    func testLocalRepositoryReturnHousesByCaseInsensitively(){
        let stark = Repository.local.house(named: "sTarK")
        XCTAssertEqual(stark?.name, "Stark")

        let keepcoding = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcoding)

    }

    func testLocalRepositoryReturnHousesByCaseInsensitivelyEnum(){
        let stark = Repository.local.houseEnum(named: .Stark)
        XCTAssertEqual(stark?.name, "Stark")

    }
    
    func testLocalRepositoryReturnSeasonsByCaseInsensitively(){
        let season = Repository.local.season(named: "game of thrones Season 1")
        XCTAssertEqual(season?.name, "Game of Thrones Season 1")
        
        let keepcoding = Repository.local.season(named: "Keepcoding")
        XCTAssertNil(keepcoding)
    }
    
    func testHouseFiltering(){
        let filtered = Repository.local.houses(filteredBy: { $0.count == 1 })
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testSeasonFiltering(){
        let filtered = Repository.local.seasons(filteredBy: { $0.count == 2 })
        XCTAssertEqual(filtered.count, 7)
    }
}
