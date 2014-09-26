//
//  ViewController.swift
//  mortgagehw2
//
//  Created by Harshpreet Singh on 8/4/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var principal: UITextField!
    
    @IBOutlet weak var interestRate: UISlider!
   
    @IBOutlet weak var finalResult: UILabel!
    
    @IBOutlet weak var durationOfLoanInYears: UISegmentedControl!
    @IBOutlet weak var withOrWithoutTaxesAndInsurance: UISwitch!
    var withOrWithoutTaxesAndInsuranceAsBool: Bool! = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //finalResult.text =  "WHAT"
        principal.text = "0"
        withOrWithoutTaxesAndInsuranceAsBool=true
        println( interestRate.description )
        println( durationOfLoanInYears.description )
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func setWithTaxesOrInsuranceOrWithout(sender: AnyObject)
    {
        if(withOrWithoutTaxesAndInsuranceAsBool){ withOrWithoutTaxesAndInsuranceAsBool=false }
        else
        {
            withOrWithoutTaxesAndInsuranceAsBool=true
        }
    }

    @IBAction func calculateMonthlyPayment(sender: AnyObject) {
        var durationOfLoanInYearsAsInt: Int
        var principalAsNumber: Float
        var interestRateAsNumber: Float
        //var withOrWithoutTaxesAndInsuranceAsBool: Bool
        var result: Float
        switch( durationOfLoanInYears.selectedSegmentIndex)
        {
            case 0:
                durationOfLoanInYearsAsInt = 10
            case 1:
                durationOfLoanInYearsAsInt = 20
            case 2:
                durationOfLoanInYearsAsInt = 30
            default:
                durationOfLoanInYearsAsInt = 0
        }
        println(durationOfLoanInYears.selectedSegmentIndex)
        println(durationOfLoanInYearsAsInt)
        
        principalAsNumber = (principal.text as NSString).floatValue
        println(principalAsNumber)
        interestRateAsNumber = interestRate.value
        
        var monthlyInterestRate: Float = interestRateAsNumber/12
        var durationOfLoanInMonths: Int = durationOfLoanInYearsAsInt*12
        var taxesAndInsurance: Float = principalAsNumber*0.01
        result = principalAsNumber
        var fractionalPart: Float = 1-pow( 1+monthlyInterestRate, -monthlyInterestRate)
        fractionalPart = monthlyInterestRate/fractionalPart
        result *= fractionalPart
        if(withOrWithoutTaxesAndInsuranceAsBool)
        {
            result += taxesAndInsurance
        }
        var resultAsString:String = String(format: "%.2f", result)
        finalResult.text = resultAsString
    }
    
}

