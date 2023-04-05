//
//  MoscowButton.swift
//  Pizza
//
//  Created by Valeria Keshishyan on 04.04.2023.
//
import UIKit

final class MoscowButton: UIButton {

    private let lable: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center
        lable.text = "Москва"
        return lable
    }()

    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "icon")
        return view
    }()

    init() {
        super.init(frame: .zero)

        addSubview(lable)
        lable.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),

            lable.centerYAnchor.constraint(equalTo: centerYAnchor),
            lable.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            lable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
