//
//  EpisodeListTableViewController.swift
//  Westeros
//
//  Created by Javi on 28/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

class EpisodeListViewController: UITableViewController {
    
    // MARK: - Properties
    let episodes: [Episode]!
    
    init(episodes: [Episode]) {
        self.episodes = episodes
        super.init(style: .plain)
        title = "Episodes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "EpisodeCell"
        
        
        //Crear una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ??
            UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let episode = episodes[indexPath.row]
        //Sincroniza el modelo con las celdas
        cell.textLabel?.text = episode.description
    }
    
}
