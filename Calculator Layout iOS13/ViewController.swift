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
    
    enum NumberMode {
        case FIRST_NUMBER
        case OPERATING_NUMBER
        case EQUAL
    }
    
    enum Operator{
        case NUL
        case ADD
        case SUB
        case MUL
        case DIV
    }
    
    let MAX_LENGTH = 10;
    
    var numberMode = NumberMode.FIRST_NUMBER;
    
    var boadrNumber:String = "";
    
    var result:Double = 0.0
    var input:Double = 0.0
    
    var isFloatValue:Bool  = false
    var decimalPlace:Double = 10.0
    var oper = Operator.NUL
    
    
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
    

    @IBAction func dividePressed(_ sender: UIButton) {
        operatoerPressed(ope: Operator.DIV)
    }
    
    @IBAction func multiplyPressed(_ sender: UIButton) {
        operatoerPressed(ope: Operator.MUL)
    }
    
    @IBAction func subPreesed(_ sender: UIButton) {
        operatoerPressed(ope: Operator.SUB)
    }
    
    @IBAction func addPreesed(_ sender: UIButton){
        operatoerPressed(ope: Operator.ADD)
    }
    
    
    @IBAction func percentagePressed(_ sender: UIButton) {
        numberMode = NumberMode.OPERATING_NUMBER
        input = 100;
        oper = Operator.MUL
        calculateNumber()
    }
    
    
    @IBAction func equalPressed(_ sender: UIButton){
        calculateNumber();
    }
    
    func calculateNumber(){
        
        print("Operater: \(oper), Result: \(result), Input: \(input)")
        
        switch oper {
        case Operator.ADD:
            result += input
        case Operator.SUB:
            result -= input
        case Operator.MUL:
            result *= input
        case Operator.DIV:
            result /= input
        default:
            return
        }
        
        oper = Operator.NUL
        numberMode = NumberMode.EQUAL
        boadrNumber = String(format: "%.6f", result)
        updateBoardNumber()
        boadrNumber = ""
        
        
    }
    
    
    @IBAction func pointPressed(_ sender: UIButton) {
        if(isFloatValue){
            return
        }
        
        isFloatValue = true;
        boadrNumber =  boadrNumber + "."
        updateBoardNumber()
    }
    
    @IBAction func acPressed(_ sender: UIButton) {
        reset()
    }
    
    
    func numberPreesed(digital : Int){
        if(numberMode == NumberMode.EQUAL){
            reset()
            numberMode = NumberMode.FIRST_NUMBER
        }
        
        if(boadrNumber.count >= MAX_LENGTH){
            return
        }
    
        if(isFloatValue){
            let n = Double(digital) / decimalPlace;
            decimalPlace *= 10;
            input += n;
        }else{
            input = input * 10 + Double(digital);
        }
        
        if(numberMode == NumberMode.FIRST_NUMBER){
            result = input;
        }
        
        boadrNumber =  boadrNumber + String(digital)
        updateBoardNumber()
    }
    
    func operatoerPressed(ope : Operator){
        oper = ope
        input = 0
        numberMode = NumberMode.OPERATING_NUMBER
        boadrNumber = ""
        isFloatValue  = false
        decimalPlace = 10.0
    }
    
    func updateBoardNumber(){
        displayNumber.text = boadrNumber;
    }
    
    func reset(){
         isFloatValue = false;
         numberMode = NumberMode.FIRST_NUMBER;
         boadrNumber = "0";
         result = 0.0
         input = 0.0
         updateBoardNumber()
         boadrNumber = "";
        decimalPlace = 10.0
    }

}

