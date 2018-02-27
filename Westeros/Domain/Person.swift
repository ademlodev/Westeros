//
//  Person.swift
//  Westeros
//
//  Created by Javi on 10/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import Foundation

final class Person{
    let name: String
    weak var house: House?
    private let _alias: String?
    
    var alias: String{
//        if let _alias = _alias{
//            //Existe y esta en _alias
//            return _alias
//        }else{
//            return ""
//        }
        return _alias ?? "" //Mejor hacerlo asi que con let (comentado arriba)
    }
    
    init(name: String,alias: String? = nil, house: House) {
        self.name = name
        self.house = house
        _alias = alias
    }
}

extension Person {
    var fullName: String{
        return "\(name) \(house?.name ?? "")"
    }
}

// MARK: - Proxies
extension Person{
    var proxyForEquality: String{
        return "\(name) \(alias) \(house?.name ?? "")"
    }
    
    var proxyForComparison: String{
        return fullName
    }
}

// MARK: - Hashable
extension Person: Hashable{
    var hashValue: Int{
        return proxyForEquality.hashValue
    }
}

// MARK: - Equatable
extension Person: Equatable{
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: -Comparable
extension Person: Comparable{
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
