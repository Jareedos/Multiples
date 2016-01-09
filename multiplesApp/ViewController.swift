//
//  ViewController.swift
//  multiplesApp
//
//  Created by Jared Sobol on 1/2/16.
//  Copyright © 2016 Appmaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var multiplesImage: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var multiplesTxtField: UITextField!

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var addLbl: UILabel!
    
    
    // Properties
    var maxMultiples = 10
    var sum = 0
    var multiple = 0
    var numAddBtnClicks = 0
    
    @IBAction func onPlayButtonTap (sender: AnyObject){
        
        if multiplesTxtField.text != nil && multiplesTxtField.text != "" {
        
          multiplesImage.hidden = true
          multiplesTxtField.hidden = true
          playBtn.hidden = true
          addLbl.hidden = false
          addBtn.hidden = false
          resetAddLblText()
          multiple = Int(multiplesTxtField.text!)!
          sum = 0
        
        }
        
    }
    
    @IBAction func onAddButtonTap (sender: AnyObject) {
        
        numAddBtnClicks += 1
       
        let newSum = sum + multiple
        updateLbl(sum, mul: multiple, newSum: newSum)
        sum += multiple
        
        if isGameOver() {
            restartGame()
        }
    
    }
    
    func restartGame(){
      multiple = 0
      numAddBtnClicks = 0
      multiplesTxtField.text = ""
      multiplesImage.hidden = false
      multiplesTxtField.hidden = false
      playBtn.hidden = false
      addLbl.hidden = true
      addBtn.hidden = true
        
    }
    
    func isGameOver() -> Bool {
        if numAddBtnClicks >= maxMultiples {
            return true
        } else {
            return false
        }
    }
    
    
    func updateLbl(oldSum: Int, mul: Int, newSum: Int) {
        addLbl.text = "\(oldSum) + \(mul) = \(newSum)"
    }
    
    func resetAddLblText(){
        addLbl.text = "Press ADD to add!"
    }
    
}
