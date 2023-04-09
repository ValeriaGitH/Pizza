//
//  MenuDataDisplayManager.swift
//  Pizza
//
//  Created by Valeria Keshishyan on 03.04.2023
//

import Foundation
import UIKit

protocol MenuDataDisplayManagerDelegate: AnyObject {
    func didSelectHeaderItem(at row: Int)
}

class MenuDataDisplayManager: NSObject {
    
    private var products = [Producto]()
    
    weak var delegate: MenuDataDisplayManagerDelegate?
    
    func update(with products: [Producto]) {
        self.products = products
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MenuDataDisplayManager: UITableViewDataSource, UITableViewDelegate {
    
    /* func numberOfSectionsInTableView(tableView: UITableView) -> Int {
         return 1
     }*/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = ProductCellViewModel()

        if let url = URL(string: products[indexPath.row].linkImagen ?? ""){
            product.img.load(url: url)
        } else {
            product.img.image = UIImage(named: "product_default")
        }
        product.title.text = products[indexPath.row].nombre
        product.info.text = products[indexPath.row].descripcion
        product.price.text = products[indexPath.row].precio
                
        let cell: ProductCell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID, for: indexPath) as! ProductCell
        
        cell.configure(with: product, isFirstCell: indexPath.row == 0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = CategoriesView()
        view.subscribe(self)
        return view
    }
    
}

// MARK: - Subscriber
extension MenuDataDisplayManager: Subscriber {
    
    func update(subject: Int) {
        delegate?.didSelectHeaderItem(at: subject)
    }
    
}
