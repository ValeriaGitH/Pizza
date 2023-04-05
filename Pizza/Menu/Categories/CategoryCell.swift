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
        
    private lazy var label: UILabel = {
        let l = UILabel()
        l.textColor = R.Colors.lightPink
        l.clipsToBounds = true
        l.layer.cornerRadius = 20
        l.layer.borderColor = R.Colors.lightPink.cgColor
        l.layer.borderWidth = 2
        l.textAlignment = .center
        l.font = R.Fonts.helveticaRegular(with: 16)


        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
                
        addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setText(text: String) ->(){
        label.text = text
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                label.textColor = R.Colors.pink
                label.layer.borderColor = R.Colors.pink.cgColor
                label.font = R.Fonts.helveticaBoldRegular(with: 16)
            } else {
                label.textColor = R.Colors.lightPink
                label.layer.borderColor = R.Colors.lightPink.cgColor
                label.font = R.Fonts.helveticaRegular(with: 16)
            }
        }
    }
}
