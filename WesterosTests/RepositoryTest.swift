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
    
    override func setUp() {
        super.setUp()
        localHouses = Repository.local.houses
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
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses(){
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryReturnHousesByCaseInsensitively(){
        let stark = Repository.local.house(named: "sTarK")
        XCTAssertEqual(stark?.name, "Stark")
        
        let keepcoding = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcoding)
    }
    
    func testHouseFiltering(){
        let filtered = Repository.local.houses(filteredBy: { $0.count == 1 })
        XCTAssertEqual(filtered.count, 1)
    }
}
