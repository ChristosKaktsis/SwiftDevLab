//
//  HomeVC.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 21/6/24.
//

import UIKit

class HomeVC: UIViewController {
    
    weak var actionHandler: BaseActionHandler?
    
    var coordinator: BaseActionHandler?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func navButtonTapped(_ sender: Any) {
        coordinator?.handleAction(action: GoToTest())
    }
}
