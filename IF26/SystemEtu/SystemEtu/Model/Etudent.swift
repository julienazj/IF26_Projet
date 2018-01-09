//
//  Etudent.swift
//  SystemEtu
//
//  Created by Julien 安 on 2018/1/7.
//  Copyright © 2018年 if26. All rights reserved.
//

import Foundation

public class Etudent: Codable{
    var id:Int
    var nom: String
    var prenom: String
    var formation: String
    var tele: Int
    
    init() {
        id = 0
        nom = ""
        prenom = ""
        formation = ""
        tele = 0
    }
    
    init(id: Int = 0,nom: String = "",prenom: String = "",formation: String = "",tele: Int = 0){
        self.id = id
        self.nom = nom
        self.prenom = prenom
        self.formation = formation
        self.tele = tele
    }
    
    // 取得索引
    func getStringFromIndex(_ index: Int) -> (String, String) {
        switch index {
        case 0:
            return ("id", "\(id)")
        case 1:
            return ("Nom", nom)
        case 2:
            return ("Prenom", prenom)
        case 3:
            return ("Formation", formation)
        case 4:
            return ("Tele", "\(tele)")

        default:
            return ("","")
        }
    }
    
    /*func getKeyboardTypeFromIndex(_ index: Int) -> UIKeyboardType {
        switch index {
        case 0:
            // id
            return UIKeyboardType.default
        case 1:
            // Nom
            return UIKeyboardType.default
        case 2:
            // Prenom
            return UIKeyboardType.default
        case 3:
            // Formation
            return UIKeyboardType.phonePad
        case 4:
            // Tele
            return UIKeyboardType.phonePad

        default:
            return UIKeyboardType.default
        }
    }*/
    
    // 儲存資料用 傳入(Key, Value)
    func setCompanyProperty(_ key: String, value: String) {
        switch key {
        // Id
        case "text1": self.id = Int(value) ?? 0
        // Nom
        case "text2": self.nom = value
        // Prenom
        case "text3": self.prenom = value
        // Formation
        case "text4": self.formation = value
        // Tele
        case "text5": self.tele = Int(value) ?? 0

        default: ""
        }
        
    }
}
