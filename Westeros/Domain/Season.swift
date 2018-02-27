//
//  Season.swift
//  Westeros
//
//  Created by Javi on 25/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

typealias Episodes = Set<Episode>

// Mark: - Season
final class Season{
    let name: String
    let releaseDate: Date
    private var _episodes: Episodes
    
    init(name: String, releaseDate: Date){
        self.name = name
        self.releaseDate = releaseDate
        _episodes = Episodes()
    }
}

extension Season{
    var count: Int{
        return _episodes.count
    }
    
    var sortedEpisodes: [Episode]{
        return _episodes.sorted()
    }
    
    func add(episode: Episode){
        guard episode.season == self else {
            return
        }
        _episodes.insert(episode)
    }
    
    func add( episodes: Episode...){
        episodes.forEach{add(episode: $0)}
    }
}

// MARK: -Proxy
extension Season{
    var proxyForEquality: String{
        return "\(name) \(releaseDate)" //TODO - Insert count of Episodes
    }
}

// MARK: - CustomStringConvertible
extension Season: CustomStringConvertible{
    var description: String {
        return "\(name)"
    }
}

// MARK: - Equatable
extension Season: Equatable{
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: - Hashable
extension Season: Hashable{
    var hashValue: Int{
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension Season: Comparable{
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality < rhs.proxyForEquality
    }
}
