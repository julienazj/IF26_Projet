//
//  AddViewController.swift
//  SystemEtu
//
//  Created by Julien 安 on 2018/1/7.
//  Copyright © 2018年 if26. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    let database = Database()

    @IBOutlet weak var TextId: UITextField!
    @IBOutlet weak var TextNom: UITextField!
    
    @IBOutlet weak var TextPrenom: UITextField!
    @IBOutlet weak var TextFormation: UITextField!
    
    @IBOutlet weak var TextTele: UITextField!
    
    @IBAction func addEtu(_ sender: UIButton) {
        let EtuId = Int(TextId.text!)
        let Nom = TextNom.text
        let Prenom = TextPrenom.text
        let Formation = TextFormation.text
        let Tele = Int(TextTele.text!)
        if Int(TextTele.text!) != nil{
            database.tableStudentInsertItem(Id: EtuId!, Nom: Nom!, Prenom: Prenom!, Formation: Formation!, Tele: Tele!)}
        else {
            self.showAlert(withTitle: "Oooops", andMessage:"Le type de Tele doit etre Int" , choiceMode: UIAlertControllerStyle.alert)
        }
    
    
        
    }
    func showAlert(withTitle title:String, andMessage message:String, choiceMode  mode:UIAlertControllerStyle) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: mode)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    /*@IBAction func btnAdd(_ sender: UIButton) {
        var EtuId = Int(TextId.text!)
        var Nom = TextNom.text
        var Prenom = TextPrenom.text
        var Formation = TextFormation.text
        var Tele = Int(TextTele.text!)
        dbEtu().ajoute(m: Etudent.init(id: EtuId?, nom: Nom?, prenom: Prenom?, formation: "ISI", tele: Tele?))
        
        
        
        self.performSegue(withIdentifier: "Login", sender: self)
        
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        

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
