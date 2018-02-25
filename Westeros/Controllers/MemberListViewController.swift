//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Javi on 19/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

class MemberListViewController: UITableViewController {
    
    let member: [Person]!
    
    init(member: [Person]) {
        self.member = member
        super.init(style: .plain)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

}
