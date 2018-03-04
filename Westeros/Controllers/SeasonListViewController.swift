//
//  SeasonListViewControler.swift
//  Westeros
//
//  Created by Javi on 27/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

let SEASON_DID_CHANGE_NOTIFICATION_NAME = "SEASON_DID_CHANGE_NOTIFICATION_NAME"
let SEASON_KEY = "SEASON_KEY"
let LAST_SEASON = "LAST_SEASON"

protocol SeasonListViewControllerDelegate: class {
    func SeasonListViewController(_ vc:SeasonListViewController, didSelectSeason: Season)
}

class SeasonListViewController: UITableViewController {

    // MARK: - Properties
    let seasons: [Season]
    weak var delegate: SeasonListViewControllerDelegate?
    
    init(seasons: [Season]) {
        self.seasons = seasons
        super.init(style: .plain)
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cycle Life
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let lastRow = UserDefaults.standard.integer(forKey: LAST_SEASON)
        let indexPath = IndexPath(row: lastRow, section: 0)
        
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        delegate?.SeasonListViewController(self, didSelectSeason: _season)
        
        //Mando la misma info a traves de las notificaciones
        let notificationCenter = NotificationCenter.default
        
        let notification = Notification(name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [SEASON_KEY: _season])
        
        notificationCenter.post(notification)
        
        //Guardar las coordenadas (section, row) de la casa seleccionada (por si el usuario cierra la app, para volver sobre ese)
        savedLastSelectedSeason(at: indexPath.row)
    }
}

extension SeasonListViewController{
    func savedLastSelectedSeason(at row: Int){
        let defaults = UserDefaults.standard
        
        defaults.set(row, forKey: LAST_SEASON)
        
        defaults.synchronize()
    }
    
    func lastSelectedSeason() -> Season{
        //Extraer la row del default
        let row = UserDefaults.standard.integer(forKey: LAST_SEASON)
        //Averigurar la casa del row
        let season = seasons[row]
        //Devolverla
        return season
    }
}

