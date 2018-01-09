//
//  LoginViewController.swift
//  SystemEtu
//
//  Created by Julien 安 on 2018/1/7.
//  Copyright © 2018年 if26. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    // 彈出警告視窗
    func showAlert(withTitle title:String, andMessage message:String, choiceMode  mode:UIAlertControllerStyle) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: mode)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var TextUsername: UITextField!
    @IBOutlet weak var TextPassWord: UITextField!
    
    @IBAction func btnLogin(_ sender: UIButton) {
        if TextUsername.text == "123" && TextPassWord.text?.md5() == "202cb962ac59075b964b07152d234b70"{
            self.performSegue(withIdentifier: "Login", sender: self)
        }else{
            self.showAlert(withTitle: "Ooops", andMessage: "Fail to Connection", choiceMode: UIAlertControllerStyle.alert)
        }
    }
    
    func md5(_ string: String) -> String {
        let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
        var digest = Array<UInt8>(repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5_Init(context)
        CC_MD5_Update(context, string, CC_LONG(string.lengthOfBytes(using: String.Encoding.utf8)))
        CC_MD5_Final(&digest, context)
        context.deallocate(capacity: 1)
        var hexString = ""
        for byte in digest {
            hexString += String(format:"%02x", byte)
        }
        return hexString
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let pwd = "123"
        let pwd_hash = md5(pwd)
        print(pwd_hash)
        self.TextPassWord.isSecureTextEntry = true
        XLXContact().getContacts()
        //print("result:"+ pwd.MD5());

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
