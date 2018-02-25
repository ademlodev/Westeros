//
//  PersonTest.swift
//  WesterosTests
//
//  Created by Javi on 10/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import XCTest
@testable import Westeros
class PersonTest: XCTestCase {
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyiron: Person!
    
    override func setUp() {
        super.setUp()
        
        starkSigil = Sigil(image: UIImage(), description: "Lobo Hueargo")
        lannisterSigil = Sigil(image: UIImage(), description: "Leon Rampante")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno",url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")! )
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!)
        
        robb = Person(name: "Robb",alias:"El joven lobo", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyiron = Person(name: "Tyrion", alias:"El Enano", house: lannisterHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCharacterExistence(){
        
        XCTAssertNotNil(robb)
        XCTAssertNotNil(arya)
    }
    
    func testFullName(){
        XCTAssertEqual(robb.fullName, "Robb Stark")
    }
    
    func testPersonEquality(){
        //Identidad
        XCTAssertEqual(tyiron, tyiron)
        
        //Igualdad
        let enano = Person(name:"Tyrion", alias: "El Enano", house: lannisterHouse)
        XCTAssertEqual(enano, tyiron)
        
        //Desigualdad
        XCTAssertNotEqual(tyiron, robb)
    }
}
