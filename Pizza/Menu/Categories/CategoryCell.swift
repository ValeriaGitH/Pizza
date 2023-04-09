//
//  CategoryCell.swift
//  Pizza
//
//  Created by Valeria Keshishyan on 03.04.2023.
//

import UIKit
import SnapKit

final class CategoryCell: UICollectionViewCell {
    
    static let reuseID = "CategoryCell"
        
    private var category: UILabel = {
        let label = UILabel()
        label.textColor = .lightPink
        label.clipsToBounds = true
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.lightPink.cgColor
        label.layer.borderWidth = 2
        label.textAlignment = .center
        label.font = UIFont.categoryCell
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
                
        addSubview(category)
        category.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setText(text: String) ->(){
        category.text = text
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                category.textColor = .pink
                category.layer.borderColor = UIColor.pink.cgColor
                category.font = UIFont.categoryCellSelect
            } else {
                category.textColor = .lightPink
                category.layer.borderColor = UIColor.lightPink.cgColor
                category.font = UIFont.categoryCell
            }
        }
    }
}
