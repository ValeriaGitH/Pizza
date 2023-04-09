//
//  MenuVC.swift
//  Pizza
//
//  Created by Valeria Keshishyan on 03.04.2023.
//

import UIKit

class MenuVC: BaseController {
   
    private let productsAPI = MenuApiManager()
    
    private lazy var menuView: MenuView? = view as? MenuView
    
    override func loadView() {
        super.loadView()
        
        view = MenuView()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        fetchProducts()
    }
    
    private func fetchProducts() {
        productsAPI.obtainPizzaProducts { [weak self] values in
            
            DispatchQueue.main.async {
                guard let self else { return }
                self.menuView?.update(with: values)
            }
        }
    }
    
    override func setupViews(){

        menuView?.setupInitialState()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let button = MoscowButton()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
}
