//
//  XLXContact.swift
//  SystemEtu
//
//  Created by Julien 安 on 2018/1/7.
//  Copyright © 2018年 if26. All rights reserved.
//

import AddressBook
import Contacts

class XLXContact: NSObject {
    

    

    lazy var myContactStore: CNContactStore = {
        let cn:CNContactStore = CNContactStore()
        return cn
    }()
    
    func getContacts() {
        
            checkContactStoreAuth()

    }
    
    

    func checkContactStoreAuth(){
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .notDetermined:
            print("未授权")
            requestContactStoreAuthorization(myContactStore)
        case .authorized:
            print("已授权")
            readContactsFromContactStore(myContactStore)
        case .denied, .restricted:
            print("无权限")
            //可以选择弹窗到系统设置中去开启
        }
    }
    
    

    func requestContactStoreAuthorization(_ contactStore:CNContactStore) {
        contactStore.requestAccess(for: .contacts, completionHandler: {[weak self] (granted, error) in
            if granted {
                print("已授权")
                self?.readContactsFromContactStore(contactStore)
            }
        })
    }
    


    func readContactsFromContactStore(_ contactStore:CNContactStore) {
        guard CNContactStore.authorizationStatus(for: .contacts) == .authorized else {
            return
        }
        
        let keys = [CNContactFamilyNameKey,CNContactGivenNameKey,CNContactPhoneNumbersKey]
        
        let fetch = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        do {
            try contactStore.enumerateContacts(with: fetch, usingBlock: { (contact, stop) in
                //姓名
                let name = "\(contact.familyName)\(contact.givenName)"
                print(name)
                //电话
                for labeledValue in contact.phoneNumbers {
                    let phoneNumber = (labeledValue.value as CNPhoneNumber).stringValue
                    print(phoneNumber)
                }
            })
        } catch let error as NSError {
            print(error)
        }
    }
}
