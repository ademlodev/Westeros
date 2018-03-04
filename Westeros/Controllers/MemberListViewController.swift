//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Javi on 19/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

protocol MemberListViewControllerDelegate: class {
    func MemberListViewController(_ vc:MemberListViewController, didSelectMember: Person)
}

class MemberListViewController: UITableViewController {
    
    var member: [Person]!
    weak var delegate: MemberListViewControllerDelegate?
    
    init(member: [Person]) {
        self.member = member
        super.init(style: .plain)
        title = "Members"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cycle life
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(HouseDidChange), name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Nos damos de baja en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return member.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MemberCell"
        
        //Crear una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ??
            UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let h = member[indexPath.row]
        //Sincroniza el modelo con las celdas
        cell.textLabel?.text = h.fullName
    }
    
    // MARK: Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Averigurar que casa han pinchado
        let _member = member[indexPath.row]
        
        let memberDetailViewController = MemberDetailViewController(member: _member)
        navigationController?.pushViewController(memberDetailViewController, animated: true)

    }

    // MARK: - Sync
    func syncModelWithView() {
        //Model -> View
        title = "Members"
        tableView.reloadData()
        
    }
    
    // MARK: - Notifications
    @objc func HouseDidChange(notification: Notification){
        //Extraer el UserInfo de la notificacion
        guard let info = notification.userInfo else{ return }
        //Sacar la casa del userInfo
        let houseInfo = info[HOUSE_KEY] as? House
        //Actualizar el modelo
        member = houseInfo!.sortedMembers
        
        //Sincronizar la vista
        syncModelWithView()
    }
    
}
