//
//  MenuView.swift
//  Pizza
//
//  Created by Valeria Keshishyan on 03.04.2023.
//

import Foundation
import UIKit

class MenuView: UIView {
    
    private var dataDisplayManager = MenuDataDisplayManager()
    
    private lazy var bannerHeaderView = BannersView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        dataDisplayManager.delegate = self
        tableView.dataSource = dataDisplayManager
        tableView.delegate = dataDisplayManager
        tableView.tableHeaderView = bannerHeaderView
        tableView.separatorStyle = .none
                
        return tableView
    }()
    
    func setupInitialState() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func update(with products: [Producto]) {
        dataDisplayManager.update(with: products)
        tableView.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let width = bounds.width
        let height = width * 0.35
        bannerHeaderView.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
}

// MARK: - MenuDataDisplayManagerDelegate
extension MenuView: MenuDataDisplayManagerDelegate {
    
    func didSelectHeaderItem(at row: Int) {
        tableView.scrollToRow(at: IndexPath(row: row, section: 0), at: .top, animated: true)
    }
    
}
