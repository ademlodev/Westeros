//
//  SeasonListViewControler.swift
//  Westeros
//
//  Created by Javi on 27/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

class SeasonListViewControler: UITableViewController {

    // MARK: - Properties
    let seasons: [Season]
    
    init(season: [Season]) {
        self.seasons = season
        super.init(style: .plain)
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cycle Life
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
        return seasons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "SeasonCell"
        
        //Descubrir cual es la temporada que tenemos que mostrar
        let seasonObj = seasons[indexPath.row]
        
        //Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if (cell == nil){
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        //Sincroniza el modelo con las celdas
        cell?.textLabel?.text = seasonObj.name
        return cell!
    }

    // MARK: Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Averigurar que temporada han pinchado
        let _season = seasons[indexPath.row]
        
        //Avisamos al delegate
        //TODO delegate?.HouseListViewController(self, didSelectHouse: _house)
        
        //Mando la misma info a traves de las notificaciones
        //let notificationCenter = NotificationCenter.default
        
        //let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY: house])
        
        //notificationCenter.post(notification)
        
        //Guardar las coordenadas (section, row) de la casa seleccionada (por si el usuario cierra la app, para volver sobre ese)
        //savedLastSelectedHouse(at: indexPath.row)
    }
}
