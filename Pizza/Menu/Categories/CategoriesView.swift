//
//  CategoriesView.swift
//  Pizza
//
//  Created by Valeria Keshishyan on 03.04.2023.
//

import UIKit

//MARK:- Protocols
protocol Subscriber : AnyObject {
    func update(subject : Int )
}

//Fix retain cycle
struct WeakSubscriber {
    weak var value : Subscriber?
}

final class CategoriesView: UITableViewHeaderFooterView  {
    
    private lazy var subscribers : [WeakSubscriber] = [] // Массив с подписчиками
    
    func subscribe(_ subscriber: Subscriber) {
        print("subscribed")
        subscribers.append(WeakSubscriber(value: subscriber))
    }
    
    private var categories = ["Пицца", "Комбо", "Десерты", "Напитки"] 
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseID)
        collectionView.allowsSelection = true
        collectionView.isUserInteractionEnabled = true
        
        return collectionView
    }()
    init() {
        
        super.init(reuseIdentifier: CategoryCell.reuseID)
        self.setupViews()
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout(section: createButtonView())
    }
    
    private func createButtonView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 8, bottom: 0, trailing: 8)
        
        let rowHeight = NSCollectionLayoutDimension.fractionalHeight(1)
        let rowSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: rowHeight)
        
        let row = NSCollectionLayoutGroup.horizontal(layoutSize: rowSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: row)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 5, trailing: 0)
        
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
}


extension CategoriesView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseID, for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }
        
        cell.setText(text: categories[indexPath.row])  
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print("Выбрана ячейка: (\(indexPath.row))")
        
        subscribers.forEach { $0.value?.update(subject: indexPath.row)}
    }
    
    
}
