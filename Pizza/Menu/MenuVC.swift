//
//  MenuVC.swift
//  Pizza
//
//  Created by Valeria Keshishyan on 03.04.2023.
//

import UIKit

class MenuVC: BaseController, Subscriber {
   
    private let productsAPI = ApiManager()
    private var products: [Producto] = []
    
    private lazy var moscowButton: MoscowButton = {
        let button = MoscowButton()
        return button
    }()
    
    private lazy var bannerHeaderView: BannersView = {
        let width = UIView.screenWidth
        let height = width * 0.35
        let bannerView = BannersView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return bannerView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = bannerHeaderView
        tableView.separatorStyle = .none
        
        //tableView.backgroundColor = .white // убрать
        
        //tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 100
                
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        fetchProducts()
    }
    
    /*override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.rowHeight = view.bounds.height / 5
    }*/
    
    private func fetchProducts() {
        /*let pp1 = Product()
        let pp2 = Product()
        products.append(pp1)
        products.append(pp2)*/
        
        products.removeAll()
        //API
        
        ApiManager.shared.GetPizza() { [weak self] values in
            DispatchQueue.main.async {
                guard let self else { return }
                self.products.append(contentsOf: values)
                self.tableView.reloadData()
                
                //save
                //UserDefaults.standard.set(self.products, forKey: "products")
            }
        }
    }
    
    internal override func setupViews(){

        //view.backgroundColor = R.Colors.background
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.moscowButton)
    }
    
    func update(subject: Int) {
        tableView.scrollToRow(at: IndexPath(row: subject, section: 0), at: .top, animated: true)
    }
    
}

extension MenuVC: UITableViewDataSource, UITableViewDelegate {
    
   /* func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }*/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
        //return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ProductCell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID, for: indexPath) as! ProductCell

        //guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID, for: indexPath) as? ProductCell else {
          //ProductCell.reuseID,  return UITableViewCell() }
        //let products = products[indexPath.row]
        
        //cell.configure(model: products)
        
        if let url = URL(string: products[indexPath.row].linkImagen ?? "") {
            cell.img.load(url: url)
        }
        
        cell.lab.text = products[indexPath.row].nombre
        cell.info.text = products[indexPath.row].descripcion
        cell.price.text = products[indexPath.row].precio
        
        if (indexPath.row == 0) {cell.around()}
        
        cell.awakeFromNib()
        
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
