//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayNumber: UILabel!
    @IBOutlet weak var no: UILabel!
    @IBOutlet weak var total: UILabel!
    
    @IBAction func sevenPressed(_ sender: UIButton) {
        numberPreesed(digital: 7)
    }

    @IBAction func eightPressed(_ sender: UIButton) {
        numberPreesed(digital: 8)
    }
    
    @IBAction func nighPressed(_ sender: UIButton) {
        numberPreesed(digital: 9)
    }
    
    @IBAction func fourPressed(_ sender: UIButton) {
        numberPreesed(digital: 4)
    }
    
    @IBAction func fivePressed(_ sender: UIButton) {
        numberPreesed(digital: 5)
       }
    
    @IBAction func sixPressed(_ sender: UIButton) {
        numberPreesed(digital: 6)
       }
    
    @IBAction func onePressed(_ sender: UIButton) {
        numberPreesed(digital: 1)
       }
    
    @IBAction func twoPressed(_ sender: UIButton) {
        numberPreesed(digital: 2)
       }
    
    @IBAction func threePressed(_ sender: UIButton) {
        numberPreesed(digital: 3)
       }
    
    @IBAction func zeroPressed(_ sender: UIButton) {
        numberPreesed(digital: 0)
    }
    
    
    var count:Float = 1;
    var sum:Float = 0;
    var boardNumber: String = "";
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        let num = Float(boardNumber) ?? 0
        sum += num
        count = count + 1
        boardNumber = "0"
        updateBoard()
    }
    
    
    @IBAction func averagePressed(_ sender: UIButton) {
        
        if(boardNumber != "0"){
            sum += Float(boardNumber) ?? 0
        }else{
            count = count - 1
        }
        
        let avg:Float = sum / count;
        boardNumber = String(format: "%.2f", avg)
        displayNumber.text = boardNumber;
        total.text = String(format: "Total: %d", Int(sum))
        no.text = "Count:\(Int(count))"
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        reset()
        updateBoard()
    }
    
    
    @IBAction func cancelCurrentPressed(_ sender: UIButton) {
        boardNumber = "0"
        updateBoard()
    }
    
    func numberPreesed(digital: Int){
        if boardNumber == "0" && digital == 0{
            return
        }
        
        if boardNumber == "0"{
            boardNumber = ""
        }
        
        boardNumber = boardNumber + String(digital)
        updateBoard()
    }
    
    
    func updateBoard(){
        displayNumber.text = boardNumber;
        total.text = String(format: "Total: %d", Int(sum))
        no.text = String(format: "No. %d", Int(count))
    }
    
    func reset(){
        count = 1;
        sum = 0;
        boardNumber = "0"
        updateBoard()
    }
    


}

