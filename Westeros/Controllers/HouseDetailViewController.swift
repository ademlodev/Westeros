//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by Javi on 12/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    // MARK: - Title
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var wordsLabel: UILabel!
    
    // MARK: - Properties
    var model: House
    
    // MARK: - Init
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle (for: type(of: self)))
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        //Model -> View
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
    }
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //hacer el codigo
        setupUI()
        syncModelWithView()
    }

    func setupUI(){
        let memberBtn = UIBarButtonItem(title: "members", style: .plain, target: self, action: #selector(displayMembers))
        let wikiBtn = UIBarButtonItem(title: "wiki", style: .plain, target: self, action: #selector(displayWiki))
        
        navigationItem.rightBarButtonItems = [memberBtn, wikiBtn]
    }
    
    @objc func displayWiki(){
        //Creamos el wikiVC
        let wikiVC = WikiViewController(house: model)
        
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    @objc func displayMembers(){
        //Creamos el memberVC
        // TODO: Implement!!
        let memberVC = MemberListViewController(member: model.sortedMembers)
        
        navigationController?.pushViewController(memberVC, animated: true)
    }

}

extension HouseDetailViewController: HouseListViewControllerDelegate{
    func HouseListViewController(_ vc: HouseListViewController, didSelectHouse house: House) {
        self.model = house
        syncModelWithView()
    }
    
    
}
