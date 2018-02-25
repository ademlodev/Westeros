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
    typealias Filter = (House) -> Bool
    var houses: [House] {get}
    func house(named: String) -> House?
    func houses(filteredBy: Filter) -> [House]
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
    func house(named name: String) -> House? {
        let house = houses.filter{ $0.name.uppercased() == name.uppercased() }.first
        return house
    }
    
    func houses(filteredBy: Filter) -> [House] {
        return houses.filter(filteredBy)
    }
    
}
