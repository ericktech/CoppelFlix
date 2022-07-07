//
//  HomeViewController.swift
//  CoppelFlix
//
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var trailingView: NSLayoutConstraint!
    @IBOutlet weak var leadingView: NSLayoutConstraint!
    
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .gray
        self.title = "TV Shows"
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
    
}
