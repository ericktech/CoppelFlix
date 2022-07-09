//
//  DetailMovieViewController.swift
//  CoppelFlix
//
//  Created by BRM16031 on 07/07/22.
//

import UIKit

protocol DetailMovieDelegate : NSObjectProtocol{
    func movieDetail(movie : MovieDetailModel)
}

class DetailMovieViewController: UIViewController, DetailMovieDelegate {
    func movieDetail(movie: MovieDetailModel) {
        movieInfo = movie
        DispatchQueue.main.async { [self] in
            self.tableView.reloadData()
        }
        
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var movieInfo = MovieDetailModel()
    public var movieId: String = ""
    
    private let presenter = DetailMoviePresenter(movieService: MovieService())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.title = "Detalle de pelicula"
    }
    
    func setup(){
        self.presenter.getMovieDetail(movieId: movieId)
        self.presenter.setViewDelegate(delegate: self)
        initTableView()
        
    }
    func initTableView(){
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: MovieDetailTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MovieDetailTableViewCell.identifier)
        self.tableView.register(UINib(nibName: CompaiesTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CompaiesTableViewCell.identifier)
    }
}
extension DetailMovieViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0 :
            guard let safeCell = tableView.dequeueReusableCell(withIdentifier: MovieDetailTableViewCell.identifier, for: indexPath) as? MovieDetailTableViewCell else {return UITableViewCell()}
            safeCell.setup(movie: movieInfo)
            return safeCell
        case 1:
            guard let safeCell = tableView.dequeueReusableCell(withIdentifier: CompaiesTableViewCell.identifier, for: indexPath) as? CompaiesTableViewCell else {return UITableViewCell()}
            guard let safeCompanies = movieInfo.productionCompanies else {return UITableViewCell()}
            safeCell.setup(companies: safeCompanies)
            return safeCell
        default :
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0 :
            return 600
        case 1 :
            
            if let safeCompanies = movieInfo.productionCompanies{
                if safeCompanies.count > 0 {return 200} else {return .zero}
            }else{
                return .zero
            }
        default :
            return .zero
        }
    }
}
