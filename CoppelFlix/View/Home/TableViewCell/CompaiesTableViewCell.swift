//
//  CompaiesTableViewCell.swift
//  CoppelFlix
//
//  Created by BRM16031 on 08/07/22.
//

import UIKit

class CompaiesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    public static var identifier = "CompaiesTableViewCell"
    public var companies = [ProductionCompany]()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setup(companies : [ProductionCompany]){
        self.companies = companies
        collectionView.register(UINib(nibName: CompaniesCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: CompaniesCollectionViewCell.identifer)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.scrollDirection = .horizontal
    }
    
}
extension CompaiesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompaniesCollectionViewCell.identifer, for: indexPath) as! CompaniesCollectionViewCell
        cell.setup(comp: companies[indexPath.row].name ?? "", imgPath: companies[indexPath.row].logoPath ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
