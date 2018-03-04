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
    var episodes: [Episode]!
    
    init(episodes: [Episode]) {
        self.episodes = episodes
        super.init(style: .plain)
        title = "Episodes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cycle life
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(SeasonDidChange), name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Nos damos de baja en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    // MARK: - Sync
    func syncModelWithView() {
        //Model -> View
        title = "Episodes"
        tableView.reloadData()
        
    }
    
    // MARK: - Notifications
    @objc func SeasonDidChange(notification: Notification){
        //Extraer el UserInfo de la notificacion
        guard let info = notification.userInfo else{ return }
        //Sacar la casa del userInfo
        let seasonInfo = info[SEASON_KEY] as? Season
        //Actualizar el modelo
        episodes = seasonInfo!.sortedEpisodes
        
        //Sincronizar la vista
        syncModelWithView()
    }
    
}
