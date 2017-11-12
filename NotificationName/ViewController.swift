//
//  ViewController.swift
//  NotificationName
//
//  Created by eric yu on 11/10/17.
//  Copyright © 2017 eric yu. All rights reserved.
//

import UIKit

extension Notification.Name {
    
    static let MyCustomNotification = Notification.Name("MyCustom")
    
}

class ViewController: UIViewController {

    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBAction func changeLabelButton(_ sender: UIButton) {
       
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: Notification.Name.UITextFieldTextDidChange, object: textfield)
        
        NotificationCenter.default.addObserver(self, selector: #selector(textStartEdit(_:)), name: Notification.Name.UITextFieldTextDidBeginEditing, object: textfield)
        //if you don't put in the object nothing will happen
  
        NotificationCenter.default.addObserver(self, selector: #selector(seqControl(_:)), name: Notification.Name.MyCustomNotification, object: nil)
  
    
    }
    
    
    @IBAction func SegmentControlDidChange(_ sender: UISegmentedControl) {
        
        NotificationCenter.default.post(name: Notification.Name.MyCustomNotification, object: nil)
    }
    
    @objc func seqControl(_ notification: Notification){
        mylabel.text = "got here with custom notification"
        
    }
    @objc func textDidChange(_ notification: Notification){
        
        mylabel.text =  "text did change bring me here"

    }
    
    @objc func textStartEdit(_ notification: Notification){
        mylabel.text =  "text become First Responder"
        
    }
}

