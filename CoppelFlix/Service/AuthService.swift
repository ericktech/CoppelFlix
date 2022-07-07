//
//  AuthService.swift
//  CoppelFlix
//

import Foundation
import FirebaseAuth

class AuthService{
    var hasError:Bool = false
    var msj:String = ""
    public init(){
    }
    func signin(userInfo:AuthUserModel, completion: @escaping (_ result: Bool, _ msj: String) -> Void){
        Auth.auth().signIn(withEmail: userInfo.Email, password: userInfo.Password){
            (user,error) in
            if error != nil{
                self.hasError = false
                self.msj = error?.localizedDescription ?? ""
            }else{
                print(error)
                self.hasError = true
            }
            completion(self.hasError, self.msj)
        }
        
        
    }
}
