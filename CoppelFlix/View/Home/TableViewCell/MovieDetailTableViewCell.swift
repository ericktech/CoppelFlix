//
//  MovieDetailTableViewCell.swift
//  CoppelFlix
//
//  Created by BRM16031 on 08/07/22.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lbltagLine: UILabel!
    @IBOutlet weak var lblDateRelease: UILabel!
    @IBOutlet weak var lblvoteCount: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    public static var identifier  = "MovieDetailTableViewCell"
    private let imagePath = "https://image.tmdb.org/t/p/w500"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(movie: MovieDetailModel) {
        lbltagLine.text = movie.tagline
        lblTitle.text = movie.title
        lblDateRelease.text = movie.releaseDate
        lblvoteCount.text = movie.voteCount?.description
        lblOverview.text  = movie.overview
        
        imgView.loadFrom(URLAddress: "\(imagePath)\(movie.posterPath ?? "")")
        
        
    }
    
}
