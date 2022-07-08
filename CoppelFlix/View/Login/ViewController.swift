//
//  ViewController.swift
//  CoppelFlix

import UIKit

class ViewController: UIViewController, MainViewDelegate {
    
    
    
    @IBOutlet weak var txtUsr: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var lblError: UILabel!
    private var userInfo = AuthUserModel()
    private let mainViewPresenter = MainViewPresenter(authService: AuthService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewPresenter.setViewDelegate(mainViewDelegate: self)
    }
    
    func LogIn(Valid: Bool, Msj: String) {
        if !Valid{
            lblError.text = Msj
        }else{
            let storyBoard: UIStoryboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeStoryboard") as! HomeViewController
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            let navigationController = UINavigationController(rootViewController: newViewController)
            self.present(navigationController, animated: true, completion: nil)
            
        }
    }
    @IBAction func btnLogin(_ sender: Any) {
        userInfo.Email = txtUsr.text ?? ""
         userInfo.Password = txtPass.text ?? ""
         mainViewPresenter.LogIn(userInfo: userInfo)
    }
}

protocol MainViewDelegate: NSObjectProtocol{
    func LogIn(Valid:Bool, Msj: String)
}

