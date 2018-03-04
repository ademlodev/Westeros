//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Javi on 28/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    @IBOutlet weak var nameSeason: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    // MARK: Properties
    var season: Season
    
    // MARK: - Init
    init(seasonObj: Season) {
        self.season = seasonObj
        super.init(nibName: nil, bundle: Bundle (for: type(of: self)))
        title = seasonObj.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        //Model -> View
        nameSeason.text = "Season \(season.name)"
        releaseDate.text = dateFormatter.string(for: season.releaseDate)
        
        title = season.name
        
        let backItem = UIBarButtonItem()
        backItem.title = season.name
        self.navigationItem.backBarButtonItem = backItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //hacer el codigo
        setupUI()
        syncModelWithView()
    }
    
    func setupUI(){
        let episodeBtn = UIBarButtonItem(title: "Episodes", style: .plain, target: self, action: #selector(displayEpisodes))
        
        navigationItem.rightBarButtonItems = [episodeBtn]
    }
    
    @objc func displayEpisodes(){
        //Creamos el episodeVC
        let episodeVC = EpisodeListViewController(episodes: season.sortedEpisodes)
        
        navigationController?.pushViewController(episodeVC, animated: true)
    }
}

extension SeasonDetailViewController: SeasonListViewControllerDelegate{
    func SeasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season) {
        self.season = season
        syncModelWithView()
    }
}


