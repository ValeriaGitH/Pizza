//
//  BannersCell.swift
//  Pizza
//
//  Created by Valeria Keshishyan on 03.04.2023.
//

import UIKit
import SnapKit

final class BannersCell: UICollectionViewCell {
    
    static let reuseID = "BannersCell"
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "b1")
        image.contentMode = .center
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(string: String) {
        
        imageView.image = UIImage(named: string)
    }
    
    private func setupView() {

        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
