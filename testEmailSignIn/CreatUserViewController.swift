//
//  CreatUserViewController.swift
//  testEmailSignIn
//
//  Created by 黃柏瀚 on 2022/6/19.
//

import UIKit
import FirebaseAuth

class CreatUserViewController: UIViewController {
    
    @IBOutlet weak var accountTF: UITextField!
    @IBOutlet weak var passwordTF1: UITextField!
    @IBOutlet weak var passwordTF2: UITextField!
    
    @IBAction func creatAccount(_ sender: Any) {
        
        let email = accountTF.text ?? ""
        let password1 = passwordTF1.text ?? ""
        let password2 = passwordTF2.text ?? ""
        
        if password1.count < 6 {
            //送出錯誤提示
            showMsg(msg: "密碼要六碼以上")
            return
        }
        
        if password1 != password2 {
            showMsg(msg: "兩次密碼不一致")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password1) { result, error in
            print(error)
            print(result)
            if let error = error {
            }else{
                let alert = UIAlertController(title: "建立成功", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                            self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alert, animated: true, completion: nil)
                    }
                }
    }
    
    
    //按住顯示密碼
    @IBAction func secDown(_ sender: Any) {
        passwordTF1.isSecureTextEntry = false
        passwordTF2.isSecureTextEntry = false
    }
    @IBAction func secTouchUpInside(_ sender: Any) {
        passwordTF1.isSecureTextEntry = true
        passwordTF2.isSecureTextEntry = true
    }
    
}

extension UIViewController{
    func showMsg(msg:String){
        let alert = UIAlertController(title: msg, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "我知道了", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
}
