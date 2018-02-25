//
//  WikiViewController.swift
//  Westeros
//
//  Created by Javi on 15/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    // MARK: - Properties
    var house: House

    init (house: House){
        self.house = house
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.isHidden = false
        loadingView.startAnimating()
        webView.navigationDelegate = self
        syncModelWithView()
    }
    
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

    // MARK: - Sync
    func syncModelWithView() {
        //Model -> View
        title = house.name
        webView.load(URLRequest(url: house.wikiURL))
    }
    
    // MARK: - Notifications
    @objc func HouseDidChange(notification: Notification){
        //Extraer el UserInfo de la notificacion
        guard let info = notification.userInfo else{ return }
        //Sacar la casa del userInfo
        let houseInfo = info[HOUSE_KEY] as? House
        //Actualizar el modelo
        house = houseInfo!
        
        //Sincronizar la vista
        syncModelWithView()
    }

    
}

extension WikiViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView.stopAnimating()
        loadingView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let type = navigationAction.navigationType
        switch type {
        case .linkActivated,.formResubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
}

