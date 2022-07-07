//
//  MainViewPresenter.swift
//  CoppelFlix
//
//  Created by BRM16031 on 05/07/22.
//

import Foundation

class MainViewPresenter{
    private let authService : AuthService
    weak private var mainViewDelegate : MainViewDelegate?
    init (authService: AuthService){
        self.authService = authService
    }
    
    func setViewDelegate(mainViewDelegate:MainViewDelegate?){
        self.mainViewDelegate = mainViewDelegate
    }
    
    func LogIn(userInfo:AuthUserModel){
        if !validateInfo(userInfo: userInfo) {
            self.mainViewDelegate?.LogIn(Valid: false, Msj: "Datos Vacios")
        }
        self.authService.signin( userInfo: userInfo, completion: {[weak self] valid, msj in
            self?.mainViewDelegate?.LogIn(Valid: valid, Msj: msj)
            
        })
        
    }
    
    func validateInfo(userInfo:AuthUserModel) -> Bool{
        if userInfo.Email == ""{
            return false
        }
        else if userInfo.Password == "" {
            return false
        }else{
            return true
        }
        
    }
}
