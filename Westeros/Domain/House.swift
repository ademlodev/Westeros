//
//  House.swift
//  Westeros
//
//  Created by Javi on 8/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

typealias Words = String
typealias Members = Set<Person>

// Mark: - House
final class House{
    let name: String
    let sigil: Sigil
    let words: Words
    let wikiURL: URL
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words,url: URL){
        self.name = name
        self.sigil = sigil
        self.words = words
        self.wikiURL = url
        _members = Members()
    }
}

extension House{
    var count: Int{
        return _members.count
    }
    
    var sortedMembers: [Person]{
        return _members.sorted()
    }
    
    func add(person: Person){
        guard person.house == self else {
            return
        }
        _members.insert(person)
    }
    
    func add( persons: Person...){
        persons.forEach{add(person: $0)}
    }
}

//MARK: -Equatable
extension House: Equatable{
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}
// MARK: -Comparable
extension House: Comparable{
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }    
}

// MARK: - Hashable
extension House: Hashable{
    var hashValue: Int{
        return proxyForEquality.hashValue
    }
}

// MARK: -Proxy
extension House{
    var proxyForEquality: String{
        return "\(name) \(words) \(count)"
    }
    
    var proxyForComparison: String{
        return name.uppercased()
    }
}

// Mark: - Sigil
final class Sigil{
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String) {
        self.image = image
        self.description = description
    }
}
