//
//  CompaniesCollectionViewCell.swift
//  CoppelFlix
//
//  Created by BRM16031 on 08/07/22.
//

import UIKit

class CompaniesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblComp: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    public static var identifer = "CompaniesCollectionViewCell"
    private let imagePath = "https://image.tmdb.org/t/p/w500"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(comp:String, imgPath:String){
        
        self.lblComp.text = comp
        if imgPath != ""{
            self.imgView.loadFrom(URLAddress: "\(imagePath)\(imgPath)")
        }
    }
    
}
