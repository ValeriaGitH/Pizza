//
//  ProductCell.swift
//  Pizza
//
//  Created by Valeria Keshishyan on 05.04.2023.
//

import UIKit

class ProductCell: UITableViewCell {

    static let reuseID = "ProductCell"
    
    private var product = ProductCellViewModel()
    
    func configure(with viewModel: ProductCellViewModel, isFirstCell: Bool){
        
        product.update(product: viewModel)
        
        if (isFirstCell){
            layer.masksToBounds = true
            layer.cornerRadius = 30
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
        awakeFromNib() 
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .white
        product.info.textColor = .lightGray
        product.info.numberOfLines = 0;

        layer.borderWidth = 1
        layer.borderColor = UIColor.separator.cgColor
        product.price.layer.borderWidth = 1
        product.price.layer.borderColor = UIColor.pink.cgColor
        product.price.layer.cornerRadius = 5
        product.price.textColor = .pink
        product.price.textAlignment = .center
        
        product.img.translatesAutoresizingMaskIntoConstraints = false
        product.title.translatesAutoresizingMaskIntoConstraints = false
        product.info.translatesAutoresizingMaskIntoConstraints = false
        product.price.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(product.img)
        contentView.addSubview(product.title)
        contentView.addSubview(product.info)
        contentView.addSubview(product.price)
        
        NSLayoutConstraint.activate([
            
            product.img.heightAnchor.constraint(equalToConstant: 132),
            product.img.widthAnchor.constraint(equalToConstant: 132),
            product.img.centerYAnchor.constraint(equalTo: centerYAnchor),
            product.img.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            product.title.heightAnchor.constraint(equalToConstant: 20),
            product.title.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            product.title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 180),
            
            product.info.heightAnchor.constraint(equalToConstant: 64),
            product.info.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            product.info.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 180),
            product.info.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            
            product.price.heightAnchor.constraint(equalToConstant: 32),
            product.price.widthAnchor.constraint(equalToConstant: 87),
            product.price.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            product.price.rightAnchor.constraint(equalTo: rightAnchor, constant: -24)
 
        ])

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
