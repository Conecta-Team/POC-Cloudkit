//
//  ViewController.swift
//  POC-Cloudkit
//
//  Created by José João Silva Nunes Alves on 13/09/21.
//

import UIKit
import CoreData
import CloudKit

class ViewController: UIViewController {

    override func viewDidLoad() {
//        CloudKitService.currentModel.createNewRecord()
        CloudKitService.currentModel.edit()
    }
}
