//
//  ViewController.swift
//  LemonadeStand
//
//  Created by terry atkins on 19/03/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // varibles
    
    var money:Int = 10
    var lemons:Int = 0
    var iceCubes:Int = 0
    var mixLemonCount:Int = 0
    var mixIceCount:Int = 0
    
    // >>>>>>>> Labels <<<<<<<<<
    @IBOutlet weak var inventoryMoneyLabel: UILabel!
    @IBOutlet weak var inventoryLemonLabel: UILabel!
    @IBOutlet weak var inventoryIceLabel: UILabel!
    @IBOutlet weak var purchaseLemonCountLabel: UILabel!
    @IBOutlet weak var purchaseIceCountLabel: UILabel!
    @IBOutlet weak var mixLemonsAvailabilityLabel: UILabel!
    @IBOutlet weak var mixIceAvailabilityLabel: UILabel!


    // >>>>>>>> Buttons <<<<<<<<<
    @IBAction func purchaseLemonsButton(sender: AnyObject) {
        lemons += 1
        money -= 2
        purchaseLemonCountLabel.text = "\(lemons)"
        inventoryLemonLabel.text = "\(lemons) Lemon(s)"
        inventoryMoneyLabel.text = "$\(money)"
    
    }
    
    @IBAction func purchaseLemonReduceButton(sender: AnyObject) {
        lemons -= 1
        money += 2
        purchaseLemonCountLabel.text = "\(lemons)"
        inventoryLemonLabel.text = "\(lemons) Lemon(s)"
        inventoryMoneyLabel.text = "$\(money)"
    }
    
    @IBAction func purchaseIceButton(sender: AnyObject) {
        iceCubes += 1
        money -= 1
        purchaseIceCountLabel.text = "\(iceCubes)"
        inventoryIceLabel.text = "\(iceCubes) Ice cube(s)"
        inventoryMoneyLabel.text = "$\(money)"
    }
    
    @IBAction func purchaseIceReduceButton(sender: AnyObject) {
        iceCubes -= 1
        money += 1
        purchaseIceCountLabel.text = "\(iceCubes)"
        inventoryIceLabel.text = "\(iceCubes) Ice cube(s)"
        inventoryMoneyLabel.text = "$\(money)"
    }
    
    @IBAction func mixAddLemonButton(sender: AnyObject) {
        lemons -= 1
        mixLemonCount += 1
        inventoryLemonLabel.text = "\(lemons) Lemon(s)"
        mixLemonsAvailabilityLabel.text = "\(mixLemonCount)"
    }
    
    @IBAction func mixSubtractLemonButton(sender: AnyObject) {
        lemons += 1
        mixLemonCount -= 1
        inventoryLemonLabel.text = "\(lemons) Lemon(s)"
        mixLemonsAvailabilityLabel.text = "\(mixLemonCount)"
        
    }
    
    @IBAction func mixAddIceButton(sender: AnyObject) {
        iceCubes -= 1
        mixIceCount += 1
        inventoryIceLabel.text = "\(iceCubes) Ice cube(s)"
        mixIceAvailabilityLabel.text = "\(mixIceCount)"
    }
    
    @IBAction func mixSubtractIceButton(sender: AnyObject) {
        iceCubes += 1
        mixIceCount -= 1
        inventoryIceLabel.text = "\(iceCubes) Ice cube(s)"
        mixIceAvailabilityLabel.text = "\(mixIceCount)"
    }
    
    @IBAction func startDayButton(sender: AnyObject) {
        // our ratio mix
        var leftSide = Double(mixLemonCount)
        var rightSide = Double(mixIceCount)
        var ratio:Double =  leftSide / rightSide
        println(" our ration is \(ratio)")
        
        // customers and their preference
        var randomCusomters = arc4random_uniform(UInt32(10)) + 1
        println("number of customers are \(randomCusomters)")
        
        let counter = Int(randomCusomters) - 1
        var customerPreference: [Double] = []
        
        for var i = 0; i <= counter; i++ {
            customerPreference.append(Double(arc4random_uniform(UInt32(11))) / 10)
            println(customerPreference)
        }
        
        for customer in customerPreference {
            if customer < 0.4 && ratio > 1 {
                money += 1
                println("paid likes 1+")
            }
            else if customer < 0.6 && ratio == 1 {
                money += 1
                println("paid likes it equal")
            }
            else if customer < 0.1 && ratio < 1 {
                money += 1
                println("paid likes it weak")
            }
            else {
                println("No payment")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

