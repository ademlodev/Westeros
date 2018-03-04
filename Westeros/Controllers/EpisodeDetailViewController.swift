//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Javi on 3/3/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var tituloResumenLabel: UILabel!
    @IBOutlet weak var resumenLabel: UILabel!
    
    // MARK: - Properties
    var episode: Episode
    
    //MARK: - Init
    init(episode: Episode){
        self.episode = episode
        super.init(nibName: nil, bundle: Bundle (for: type(of: self)))
        title = episode.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        //Model -> View
        tituloResumenLabel.text = "Resumen del episodio: \(episode.title)"
        resumenLabel.text = episode.resumen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //hacer el codigo
        syncModelWithView()
    }

}
