//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Javi on 17/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

let HOUSE_KEY = "HouseKey"
let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "houseDidChangeNotification"
let LAST_HOUSE = "LastHouse"

protocol HouseListViewControllerDelegate: class {
    func HouseListViewController(_ vc:HouseListViewController, didSelectHouse: House)
}
class HouseListViewController: UITableViewController {
    
    // MARK: - Properties
    let house: [House]
    weak var delegate: HouseListViewControllerDelegate?
    
    init(house: [House]) {
        self.house = house
        super.init(style: .plain)
        title = "Houses"
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
        
        let lastRow = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        let indexPath = IndexPath(row: lastRow, section: 0)
        
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return house.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HouseCell"
        
        // Descubrir cual es la casa que tenemos que mostrar
        let h = house[indexPath.row]
        
        //Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if (cell==nil){
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        //Sincroniza el modelo con las celdas
        cell?.imageView?.image = h.sigil.image
        cell?.textLabel?.text = h.name
        return cell!
        
    }
    
    // MARK: Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Averigurar que casa han pinchado
        let _house = house[indexPath.row]

        //Avisamos al delegate
        delegate?.HouseListViewController(self, didSelectHouse: _house)
        
        //Mando la misma info a traves de las notificaciones
        let notificationCenter = NotificationCenter.default
        
        let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY: house])
        
        notificationCenter.post(notification)
        
        //Guardar las coordenadas (section, row) de la casa seleccionada (por si el usuario cierra la app, para volver sobre ese)
        savedLastSelectedHouse(at: indexPath.row)
    }
}

extension HouseListViewController{
    func savedLastSelectedHouse(at row: Int){
        let defaults = UserDefaults.standard
        
        defaults.set(row, forKey: LAST_HOUSE)
        
        defaults.synchronize()
    }
    
    func lastSelectedHouse() -> House{
        //Extraer la row del default
        let row = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        //Averigurar la casa del row
        let h = house[row]
        //Devolverla
        return h
    }
}
