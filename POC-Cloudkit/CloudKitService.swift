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

//    func readAll() {
//        let predicate = NSPredicate(value: true)
//
//        let query = CKQuery(recordType: "User", predicate: predicate)
//
//        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (results, error) in
//            if let erro = error {
//                DispatchQueue.main.async {
//                    completion(.failure(erro))
//                }
//            }
//
//            guard let result = results else {return}
//
//            let alunos = result.compactMap {
//                Alunos(record: $0)
//            }
//
//            DispatchQueue.main.async {
//                completion(.success(alunos))
//            }
//        }
//    }
//    func editRecord(aluno: CKRecord) {
//        aluno["Numero"] = 1
//
//        self.container.privateCloudDatabase.save(aluno) { (record, erro) in
//
//        }
//    }
//
//    func delete(aluno: CKRecord.ID) {
//
//        self.container.privateCloudDatabase.delete(withRecordID: aluno) { (record, erro) in
//
//        }
//    }
//
//    func fetchPrivateDB(_ completion: @escaping (CKRecord) -> Void) {
//        let predicate = NSPredicate(value: true)
//
//        let query = CKQuery(recordType: "Alunos", predicate: predicate)
//
//        let operation = CKQueryOperation(query: query)
//        operation.zoneID = CKRecordZone.default().zoneID
//        operation.recordFetchedBlock = { record in
//            completion(record)
//        }
//
//        self.container.privateCloudDatabase.add(operation)
//    }
    
//    func addSub() {
//        let sub = CKSubscription(coder: NSCoder())
//
//    }

//    func fetchAlunos(_ completion: @escaping (Result<[Alunos], Error>) -> Void) {
//        let predicate = NSPredicate(value: true)
//
//        let query = CKQuery(recordType: "Alunos", predicate: predicate)
//
//        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (results, error) in
//            if let erro = error {
//                DispatchQueue.main.async {
//                    completion(.failure(erro))
//                }
//            }
//
//            guard let result = results else {return}
//
//            let alunos = result.compactMap {
//                Alunos(record: $0)
//            }
//
//            DispatchQueue.main.async {
//                completion(.success(alunos))
//            }
//        }
//    }
}
