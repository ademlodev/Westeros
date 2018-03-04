//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Javi on 4/3/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    @IBOutlet weak var nameMemberLabel: UILabel!
    @IBOutlet weak var aliasMemberLabel: UILabel!
    
    // MARK: - Properties
    var member: Person
    
    //MARK: - Init
    init(member: Person){
        self.member = member
        super.init(nibName: nil, bundle: Bundle (for: type(of: self)))
        title = member.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        //Model -> View
        nameMemberLabel.text = "\(member.name)"
        aliasMemberLabel.text = "\(member.alias)"
        
        let backItem = UIBarButtonItem()
        backItem.title = member.name
        self.navigationItem.backBarButtonItem = backItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        syncModelWithView()
    }

}

extension MemberDetailViewController: MemberListViewControllerDelegate{
    func MemberListViewController(_ vc: MemberListViewController, didSelectMember member: Person) {
        self.member = member
        syncModelWithView()
    }
}
