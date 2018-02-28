//
//  Episode.swift
//  Westeros
//
//  Created by Javi on 25/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import Foundation

// Mark: - Episode
final class Episode{
    let title: String
    let emisionDate: Date
    let resumen: String
    weak var season: Season?
    
    init(title: String, emisionDate: Date, season: Season, resumen: String){
        self.title = title
        self.emisionDate = emisionDate
        self.season = season
        self.resumen = resumen
    }
}

// MARK: -Proxy
extension Episode{
    var proxyForEquality: String{
        return "\(title)"
    }
    
}

// MARK: - CustomStringConvertible
extension Episode: CustomStringConvertible{
    var description: String {
        return "\(title)"
    }
}

// MARK: - Equatable
extension Episode: Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: - Hashable
extension Episode: Hashable{
    var hashValue: Int{
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension Episode: Comparable{
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality < rhs.proxyForEquality
    }
}
