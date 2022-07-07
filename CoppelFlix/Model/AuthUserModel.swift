//
//  AuthUserModel.swift
//  CoppelFlix

import Foundation

class AuthUserModel{
    var Email: String = ""
    var Password: String = ""
    var Uid: String = ""
    var hasError: Bool = false
    
    public func User(_email: String, _password:String){
        Email = _email
        Password = _password
    }
    
    public func isValid() -> Bool{
        if(self.Email == ""){
            return false
        }else if (self.Password == ""){
            return false
        }else{
            return true
        }
    }
    public init(){
        
    }
}

