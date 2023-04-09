//
//  ProductCellViewModel.swift
//  Pizza
//
//  Created by Valeria Keshishyan on 09.04.2023.
//

import UIKit

struct ProductCellViewModel {
    
    var img =  UIImageView()
    var title = UILabel()
    var info = UILabel()
    var price = UILabel()
    
    mutating func update(product: ProductCellViewModel){
        img = product.img
        title.text = product.title.text
        info.text = product.info.text
        price.text = product.price.text
    }
}
