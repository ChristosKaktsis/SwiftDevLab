//
//  HomeVC.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 21/6/24.
//

import UIKit

class HomeVC: UIViewController {
    
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func navButtonTapped(_ sender: Any) {
        viewModel.onTriggeredEvent(event: .GoToTest)
    }
}
