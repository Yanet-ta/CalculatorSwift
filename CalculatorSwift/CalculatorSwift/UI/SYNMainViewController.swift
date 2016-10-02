//
//  SYNMainViewController.swift
//  CalculatorSwift
//
//  Created by Yana Ivanova on 25.09.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import UIKit

class SYNMainViewController: UIViewController {
    enum SYNOperations : Int {
        case UndefOperation = 0
        case AdditionOperation  = 1
        case SubtractionOperation  = 2
        case MultiplicationOperation  = 3
        case DivisionOperation  = 4
    }
    
    var firstArg: Double = 0
    var secondArg: Double = 0
    var currentOperation = SYNOperations.UndefOperation
    var lastActionWasOperation = false
    var operationsWasUsed = false

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var inputLabel: UILabel!
    
    @IBAction func didTapAllClearButton(_ sender: AnyObject) {
        firstArg = 0
        secondArg = 0
        currentOperation = SYNOperations.UndefOperation
        lastActionWasOperation = false
        operationsWasUsed = false
        updateDisplayText()
        inputLabel.text = ""
    }
    
    @IBAction func didTapClearButton(_ sender: AnyObject) {
        secondArg = 0
        updateDisplayText()
    }
    
    @IBAction func didTapInverseButton(_ sender: AnyObject) {
        secondArg = -secondArg
        updateDisplayText()
    }
    
    @IBAction func didTapAdditionOperationButton(_ sender: AnyObject) {
        //inputLabel.text?.append("+")
        processOperation(operation: SYNOperations.AdditionOperation)
    }
    
    @IBAction func didTapSubtractionOperationButton(_ sender: AnyObject) {
        //inputLabel.text?.append("-")
        processOperation(operation: SYNOperations.SubtractionOperation)
    }
    
    @IBAction func didTapMultiplicationOperationButton(_ sender: AnyObject) {
        //inputLabel.text?.append("*")
        processOperation(operation: SYNOperations.MultiplicationOperation)
    }
    
    @IBAction func didTapDivisionOperationButton(_ sender: AnyObject) {
        //inputLabel.text?.append("/")
        processOperation(operation: SYNOperations.DivisionOperation)
    }
    
    @IBAction func didTapTotalButton(_ sender: AnyObject) {
        //inputLabel.text?.append("=")
        processOperation(operation: SYNOperations.UndefOperation)
    }
    
    @IBAction func didTapCommaButton(_ sender: AnyObject) {
        
    }
    
    @IBAction func didTapNumButton(_ sender: AnyObject) {
        if let enteredNumber = sender.tag {
            if (lastActionWasOperation) {
                firstArg = secondArg
                secondArg = 0
                lastActionWasOperation = false
            }
            secondArg = secondArg * 10 + Double(enteredNumber)
            updateDisplayText()
            //inputLabel.text?.append(String(sender.tag))
        }
    }

    func processOperation(operation:SYNOperations) {
        if (operationsWasUsed) {
            if (!lastActionWasOperation) {
                switch currentOperation {
                case .AdditionOperation:
                    secondArg = firstArg + secondArg
                case .SubtractionOperation:
                    secondArg = firstArg - secondArg
                case .MultiplicationOperation:
                    secondArg = firstArg * secondArg
                case .DivisionOperation:
                    secondArg = firstArg / secondArg
                default: break
                }
            }
            //else {
                //inputLabel.text = String(format: "%.f", secondArg)
            //}
        }
        firstArg = secondArg
        currentOperation = operation
        lastActionWasOperation = true
        operationsWasUsed = true
        updateDisplayText()
    }
    
    
    func updateDisplayText() {
        displayLabel.text = String(format: "%.f", secondArg)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
