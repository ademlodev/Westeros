//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Javi on 8/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import XCTest
@testable import Westeros
class HouseTests: XCTestCase {
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!

    var starkHouse: House!
    var lannisterHouse: House!
    var starkHouseSorted: House!
    
    var robb: Person!
    var arya: Person!
    var tyiron: Person!
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: UIImage(), description: "Lobo Hueargo")
        lannisterSigil = Sigil(image: UIImage(), description: "Leon Rampante")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno",url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")! )
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!)
        //starkHouseSorted = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno",url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")! )
        
        robb = Person(name: "Robb",alias:"El joven lobo", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyiron = Person(name: "Tyrion", alias:"El enano", house: lannisterHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence(){
        //given
        //when
        //then
        
        XCTAssertNotNil(starkHouse)
        XCTAssertNotNil(lannisterHouse)
    }
    
    func testSigilExixstence(){
        XCTAssertNotNil(starkSigil)
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPerson(){
        
        XCTAssertEqual(starkHouse.count, 0)
        
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyiron)
        XCTAssertEqual(starkHouse.count, 2) //, "starkHouse deberia ser 2 por no permitir una persona de otra casa")
        
        let robb1 = Person(name: "Robb",alias:"El joven lobo", house: starkHouse)
        let arya1 = Person(name: "Arya", house: starkHouse)
        starkHouse.add(persons: robb1, arya1)
        XCTAssertEqual(starkHouse.count, 2)
    }
    
    func testHouseEquality(){
        //Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        //Igualdad
        let jinxed = House(name: "Stark",sigil: starkSigil, words: "Se acerca el invierno",url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")! )
        XCTAssertEqual(jinxed, starkHouse)
        
        //Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHashable(){
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparison(){
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
    
    func testHouseReturnsSortedArrayOfMembers(){
        starkHouse.add(persons: robb,arya)
        
        XCTAssertEqual(starkHouse.sortedMembers, [arya,robb])
    }
    
}
