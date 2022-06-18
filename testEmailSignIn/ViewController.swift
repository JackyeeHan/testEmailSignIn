//
//  ViewController.swift
//  testEmailSignIn
//
//  Created by 黃柏瀚 on 2022/6/19.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var accountTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                self.message.text += "\nis SignIn name:\(user.displayName)"
                self.message.text += "\nis Email V:\(user.isEmailVerified)"
            }else{
                self.message.text += "\nis SignOut"
                }
            }
    }

    @IBAction func logOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {}
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        let account = accountTF.text ?? ""
        let password = passwordTF.text ?? ""
        Auth.auth().signIn(withEmail: account, password: password) { result, error in
        if let error = error{
            self.showMsg(msg: error.localizedDescription)
        }
    }
        
}
    
    @IBAction func emailVerify(_ sender: Any) {
        if let user = Auth.auth().currentUser{
            user.uid
            user.sendEmailVerification { error in
        if let error = error{
        }else{
            self.showMsg(msg: "驗證Email已發出 請至電子信箱確認")
        }
        }
    }
    }
}

