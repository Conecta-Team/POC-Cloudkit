//
//  modelCloudKit.swift
//  estudandoCloudKit
//
//  Created by José João Silva Nunes Alves on 19/10/20.
//

import Foundation
import CloudKit

class CloudKitService {
    let container: CKContainer
    let publicDatabase: CKDatabase
    
    static var currentModel = CloudKitService()
    
    init() {
        self.container = CKContainer(identifier: "iCloud.POC-Cloudkit")
        self.publicDatabase = container.publicCloudDatabase
    }
    
    func createNewRecord() {
        let user = CKRecord(recordType: "User")
        user["name"] = "jao-Private"
        
        self.container.publicCloudDatabase.save(user) { (record, erro) in
        }
    }
    
    func readGame() {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Game", predicate: predicate)
        
        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (results, error) in
              print("results, errors")
            }
    }
    
    func readUser(completion: @escaping ([CKRecord])->Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "User", predicate: predicate)
        
        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (results, error) in
                completion(results!)
              print("results, errors")
            }
    }
    
    func edit() {
        self.readUser { result in
            let user = result[0]
            user["name"] = "deu bonzao"
            
            self.container.publicCloudDatabase.save(user) { record, error in
                print(record, error)
            }
        }
    }

}
