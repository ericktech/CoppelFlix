//
//  HomeViewController.swift
//  CoppelFlix
//
//

import Foundation
import UIKit

protocol HomeViewDelegate: NSObjectProtocol{
    func setMovies(movies: [ResultMovie])
}
protocol ViewToastDelegate: NSObjectProtocol{
    func showToast(msj:String)
}

class HomeViewController: UIViewController, HomeViewDelegate, ViewToastDelegate{
    func showToast(msj: String) {
        DispatchQueue.main.async {
            self.view.showToast(toastMessage: msj, duration: 1.1)
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var trailingView: NSLayoutConstraint!
    @IBOutlet weak var leadingView: NSLayoutConstraint!
    
    private var movies = [ResultMovie]()
    private let homePresenter = HomeViewPresenter(movieService: MovieService())
    private let moviesColPresenter = MoviesCollectionViewPresenter()
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .gray
        self.title = "TV Shows"
        self.homePresenter.setViewDelegate(delegate: self, toastDelegate: self)
        
        config()
    }
    
    func config(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        homePresenter.getMovies()
        
    }
    
    
    
    @IBAction func logOutTapp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(identifier: "Main")
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
    }
    
    
    @IBAction func menuTapp(_ sender: Any) {
        displayMenu()
        animateMenu()
    }
    func animateMenu(){
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()}, completion: nil)
    }
    func displayMenu(){
        if !menuOut{
            leadingView.constant = 150
            trailingView.constant = -150
            menuOut = true
        }else{
            leadingView.constant = 0
            trailingView.constant = 0
            menuOut = false
        }
    }
    
    func setMovies(movies: [ResultMovie]) {
        self.movies = movies
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as! MoviesCollectionViewCell
        cell.config(with: movies[indexPath.row])
        cell.setDelegate(delegate: self)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
}

extension HomeViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailMovie") as! DetailMovieViewController
        vc.movieId = movies[indexPath.row].id?.description ?? ""
        navigationController?.pushViewController(vc,animated: true)
    }
}
