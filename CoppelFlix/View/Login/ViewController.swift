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
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        mainViewPresenter.setViewDelegate(mainViewDelegate: self)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func LogIn(Valid: Bool, Msj: String) {
        if !Valid{
            lblError.text = Msj
        }else{
            let storyBoard: UIStoryboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
            if let viewController = storyBoard.instantiateViewController(withIdentifier: "HomeStoryboard") as? HomeViewController{
                let homeNavController = UINavigationController()
                homeNavController.setViewControllers([viewController], animated: false)
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(homeNavController);
            }
            
            
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

