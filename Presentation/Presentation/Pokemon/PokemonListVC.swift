//
//  PokemonListVC.swift
//  Presentation
//
//  Created by Christos Kaktsis on 26/6/24.
//

import UIKit

class PokemonListVC: UIViewController {
    
    private let viewModel: PokemonListViewModel
    
    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokemon"
        viewModel.onTriggeredEvent(event: .fetchData)
    }
}
