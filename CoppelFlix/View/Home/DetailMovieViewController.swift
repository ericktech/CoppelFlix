//
//  DetailMovieViewController.swift
//  CoppelFlix
//
//  Created by BRM16031 on 07/07/22.
//

import UIKit

class DetailMovieViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblLenguage: UILabel!
    @IBOutlet weak var lblvoteAverage: UILabel!
    @IBOutlet weak var lblvoteCount: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    private let imagePath = "https://image.tmdb.org/t/p/w500"

    public var movieInfo = ResultMovie()
    override func viewDidLoad() {
        super.viewDidLoad()

     // Do any additional setup after loading the view.
        lblTitle.text = movieInfo.title
        lblLenguage.text = movieInfo.originalLanguage?.rawValue
        lblvoteCount.text = movieInfo.voteCount.description
        lblvoteAverage.text = movieInfo.voteAverage.description
        lblOverview.text = movieInfo.overview
        imgView.loadFrom(URLAddress: "\(imagePath)\(movieInfo.posterPath)")

    }
    
}
