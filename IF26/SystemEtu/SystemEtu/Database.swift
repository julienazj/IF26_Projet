//
//  database.swift
//  IF26_projet
//
//  Created by Julien 安 on 2018/1/6.
//  Copyright © 2018年 if26. All rights reserved.
//

import Foundation
import SQLite

struct Database {
    var db: Connection!
    
    init() {
        connectDatabase()
    }
    
    // 与数据库建立连接
    mutating func connectDatabase(filePath: String = "/Documents") -> Void {
        
        let sqlFilePath = "/Users/an" + filePath + "/db.sqlite3"
        //NSHomeDirectory() + filePath + "/db.sqlite3"
        
        do { // 与数据库建立连接
            db = try Connection(sqlFilePath)
            print("与数据库建立连接 成功")
        } catch {
            print("与数据库建立连接 失败：\(error)")
        }
        
    }
    
    // ===================================== Student =====================================
    let TABLE_Student = Table("table_Student") // Nom de table
    let TABLE_Student_ID = Expression<Int>("Student_Id") // Attribut
    let TABLE_Student_NOM = Expression<String>("Student_Nom")
    let TABLE_Student_PRENOM = Expression<String>("Student_Prenom")
    let TABLE_Student_FORMATION = Expression<String>("Student_FORMATION")
    let TABLE_Student_TELE = Expression<Int>("Student_TELE")
    //obtenir array table
    
    func getArrayTable() -> Array<Any>{
        do{
            let arDb = Array(try db.prepare(TABLE_Student))
            //print(arDb)
            return arDb
        }
        catch{
            print("get array failed")
            return []
        }
    }
    
    // Set Table
    func tableStudentCreate() -> Void {
        do { // Create table
            try db.run(TABLE_Student.create { table in
                table.column(TABLE_Student_ID, primaryKey: .autoincrement) // primaryKey
                table.column(TABLE_Student_NOM)
                table.column(TABLE_Student_PRENOM)
                table.column(TABLE_Student_FORMATION)
                table.column(TABLE_Student_TELE)
            })
            print("Create TABLE_Student Success")
        } catch {
            print("Create TABLE_Student Fail：\(error)")
        }
    }
    
    // 插入
    func tableStudentInsertItem(Id: Int, Nom: String, Prenom: String, Formation: String, Tele: Int) -> Void {
        let insert = TABLE_Student.insert(TABLE_Student_ID <- Id, TABLE_Student_NOM <- Nom, TABLE_Student_PRENOM <- Prenom, TABLE_Student_FORMATION <- Formation, TABLE_Student_TELE <- Tele)
        do {
            let rowid = try db.run(insert)
            print("Insert success id: \(rowid)")
        } catch {
            print("Insert fail id: \(error)")
        }
    }
    
    // 遍历
    func queryTableStudent() -> Void {
        for item in (try! db.prepare(TABLE_Student)) {
            print("Student query ———— id: \(item[TABLE_Student_ID]), Nom: \(item[TABLE_Student_NOM]), Prenom: \(item[TABLE_Student_PRENOM]), Formation: \(item[TABLE_Student_FORMATION]), Telephone: \(item[TABLE_Student_TELE])")
        }
    }
    //get real array
    func getRealArrayTable() -> Array<Etudent> {
        var realAr :[Etudent] = []
        print("0")
        //for etu:Etudent in realAr{
        for item in (try! db.prepare(TABLE_Student)){
            let etu: Etudent
         //   let item = try db.pluck(TABLE_Student)
            
            
            print(item[TABLE_Student_ID])
            print(item[TABLE_Student_NOM])
            realAr.append(Etudent.init(id: item[TABLE_Student_ID], nom: item[TABLE_Student_NOM], prenom: item[TABLE_Student_PRENOM], formation: item[TABLE_Student_FORMATION], tele: item[TABLE_Student_TELE]))
            print(realAr)
           /* etu?.id = item[TABLE_Student_ID]
            print(etu?.id)
            print("1")
            etu!.nom = item[TABLE_Student_NOM] as String
                etu!.prenom = item[TABLE_Student_PRENOM] as String
                etu!.formation = item[TABLE_Student_FORMATION] as String
                etu!.tele = item[TABLE_Student_TELE] as Int*/
           // realAr.append(etu!)
            }
        
        return realAr
    }
    
    // 读取
    func readTableStudentItem(Nom: String) -> Void {
        
        for item in try! db.prepare(TABLE_Student.filter(TABLE_Student_NOM == Nom)) {
            print("\n读取（student）id: \(item[TABLE_Student_ID]), Nom: \(item[TABLE_Student_NOM]), Prenom: \(item[TABLE_Student_PRENOM]), Formation: \(item[TABLE_Student_FORMATION]), Tele: \(item[TABLE_Student_TELE])")
        }
        
    }
    /*
     // 更新
     func tableLampUpdateItem(address: Int64, newName: String) -> Void {
     let item = TABLE_LAMP.filter(TABLE_LAMP_ADDRESS == address)
     do {
     if try db.run(item.update(TABLE_LAMP_NAME <- newName)) > 0 {
     print("灯光\(address) 更新成功")
     } else {
     print("没有发现 灯光条目 \(address)")
     }
     } catch {
     print("灯光\(address) 更新失败：\(error)")
     }
     }
     */
    
    // 删除
    func tableEtudiantDeleteItem(Id: Int) -> Void {
        let item = TABLE_Student.filter(TABLE_Student_ID == Id)
        do {
            if try db.run(item.delete()) > 0 {
                print("Student\(Id) delata successful")
            } else {
                print("No data \(Id)")
            }
        } catch {
            print("data\(Id) delata fail：\(error)")
        }
    }
}
