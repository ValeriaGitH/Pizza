//
//  ProductCell.swift
//  Pizza
//
//  Created by Valeria Keshishyan on 05.04.2023.
//

import UIKit

class ProductCell: UITableViewCell {

    static let reuseID = "ProductCell"
    
    let img =  UIImageView()
    let lab = UILabel()
    let info = UILabel()
    let price = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .white
        info.textColor = R.Colors.lightGray
        info.numberOfLines = 0;

        layer.borderWidth = 1
        layer.borderColor = R.Colors.separator.cgColor
        price.layer.borderWidth = 1
        price.layer.borderColor = R.Colors.pink.cgColor
        price.layer.cornerRadius = 5
        price.textColor = R.Colors.pink
        price.textAlignment = .center
        //price.baselineAdjustment = .alignCenters
        
        
        img.translatesAutoresizingMaskIntoConstraints = false
        lab.translatesAutoresizingMaskIntoConstraints = false
        info.translatesAutoresizingMaskIntoConstraints = false
        price.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(img)
        contentView.addSubview(lab)
        contentView.addSubview(info)
        contentView.addSubview(price)
        
        NSLayoutConstraint.activate([
            
            img.heightAnchor.constraint(equalToConstant: 132),
            img.widthAnchor.constraint(equalToConstant: 132),
            img.centerYAnchor.constraint(equalTo: centerYAnchor),
            img.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            lab.heightAnchor.constraint(equalToConstant: 20),
            lab.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            lab.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 180),
            
            info.heightAnchor.constraint(equalToConstant: 64),
            info.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            info.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 180),
            info.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            
            price.heightAnchor.constraint(equalToConstant: 32),
            price.widthAnchor.constraint(equalToConstant: 87),
            price.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            price.rightAnchor.constraint(equalTo: rightAnchor, constant: -24)
 
        ])

    }
    
    func around(){
        
        layer.masksToBounds = true
        layer.cornerRadius = 30

        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
