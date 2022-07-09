//
//  ProfileViewController.swift
//  CoppelFlix

import UIKit

protocol ProfileViewDelegate: NSObjectProtocol{
    func FavMovies(movies: [MoviesFav])
}

class ProfileViewController: UIViewController, ProfileViewDelegate {

    
    func FavMovies(movies: [MoviesFav]) {
        self.movies = movies
        DispatchQueue.main.async {
            self.collectionView.reloadData()
           }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var movies = [MoviesFav]()
    private let profilePresenter = ProfileViewPresenter(movieService: MovieService())
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profilePresenter.setViewDelegate(delegate: self)
        config()
        
    }
    func config(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.scrollDirection = .horizontal
        profilePresenter.getFavMovies()
        
    }
    
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as! FavMoviesCollectionViewCell
        cell.configFavs(with: movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout{
 

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
}

extension ProfileViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailMovie") as! DetailMovieViewController
        vc.movieId = movies[indexPath.row].idMovie ?? ""
        navigationController?.pushViewController(vc,animated: true)
        
    }
}
