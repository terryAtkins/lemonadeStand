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
    var counter:Int = 0 // number of customers
    var customersPaided:Int = 0
    
    // >>>>>>>> Labels <<<<<<<<<
    @IBOutlet weak var inventoryMoneyLabel: UILabel!
    @IBOutlet weak var inventoryLemonLabel: UILabel!
    @IBOutlet weak var inventoryIceLabel: UILabel!
    @IBOutlet weak var purchaseLemonCountLabel: UILabel!
    @IBOutlet weak var purchaseIceCountLabel: UILabel!
    @IBOutlet weak var mixLemonsAvailabilityLabel: UILabel!
    @IBOutlet weak var mixIceAvailabilityLabel: UILabel!
    @IBOutlet weak var showsCustomersVisited: UILabel!
    @IBOutlet weak var numberOfCustomersTodayLabel: UILabel!
    @IBOutlet weak var ShowImageLabel: UIImageView!
    
    
    
    // >>>>>>>> Buttons <<<<<<<<<
    @IBAction func gameReset(sender: AnyObject) {
        
        money = 10
        customersPaided = 0
        lemons = 0
        iceCubes = 0
        mixLemonCount = 0
        mixIceCount = 0
        showsCustomersVisited.hidden = true
        numberOfCustomersTodayLabel.hidden = true
        ShowImageLabel.hidden = true
        updateUI()
    }
    
    
    @IBAction func purchaseLemonsButton(sender: AnyObject) {
        if money >= 2 {
            lemons += 1
            money -= 2
            updateUI()
            
        } else {
            showAlertWithText( message: "You don't have any money... sell some lemonade")
        }
    }
    
    @IBAction func purchaseLemonReduceButton(sender: AnyObject) {
        if lemons > 0 {
            lemons -= 1
            money += 2
            updateUI()
            
        } else {
            showAlertWithText( message: "You don't have any lemons... buy more")
        }
        
    }
    
    @IBAction func purchaseIceButton(sender: AnyObject) {
        if money >= 1 {
            iceCubes += 1
            money -= 1
            updateUI()
            
        } else {
            showAlertWithText( message: "You don't have any money... sell some lemonade")
        }
    }
    
    @IBAction func purchaseIceReduceButton(sender: AnyObject) {
        if iceCubes > 0 {
            iceCubes -= 1
            money += 1
            updateUI()
            
        } else {
            showAlertWithText( message: "You don't have any ice... buy more")
        }
    }
    
    @IBAction func mixAddLemonButton(sender: AnyObject) {
        if lemons > 0 {
            lemons -= 1
            mixLemonCount += 1
            updateUI()
            
        } else {
            showAlertWithText( message: "You don't have any lemons... buy more")
        }
    }
    
    @IBAction func mixSubtractLemonButton(sender: AnyObject) {
        if mixLemonCount > 0 {
            lemons += 1
            mixLemonCount -= 1
            updateUI()
            
        } else {
            showAlertWithText( message: "You don't have any lemons in the mix")
        }
        
    }
    
    @IBAction func mixAddIceButton(sender: AnyObject) {
        if iceCubes > 0 {
            iceCubes -= 1
            mixIceCount += 1
            updateUI()
            
        } else {
            showAlertWithText( message: "You don't have any ice... buy more")
        }
    }
    
    @IBAction func mixSubtractIceButton(sender: AnyObject) {
        if mixIceCount > 0 {
            iceCubes += 1
            mixIceCount -= 1
            updateUI()
            
        } else {
            showAlertWithText( message: "You don't have any ice in the mix")
        }
    }
    
    @IBAction func startDayButton(sender: AnyObject) {
        
        if mixLemonCount > 0 || mixIceCount > 0 {

            
            // our ratio mix
            var leftSide = Double(mixLemonCount)
            var rightSide = Double(mixIceCount)
            var ratio:Double =  leftSide / rightSide
            println(" our ration is \(ratio)")
            
            // customers and their preference
            var randomCusomters = arc4random_uniform(UInt32(10)) + 1
            println("number of customers are \(randomCusomters)")
            
            counter = Int(randomCusomters)
            var customerPreference: [Double] = []
            
            // make visiable
            showsCustomersVisited.hidden = false
            numberOfCustomersTodayLabel.hidden = false
            ShowImageLabel.hidden = false
            
            let getRandomImage = randomImages()
            let showRandomImage = getRandomImage.randomImage()
            ShowImageLabel.image = UIImage(named: showRandomImage)
            
            
            
            switch showRandomImage {
            case "cold":
                counter += 1
                println("case cold")
            case "mild":
                counter += 1
                println("case mild")
            case "warm":
                counter += 4
                println("case warm")
            default:
                counter += 0
                println("case 0")
                
            }
            
            showsCustomersVisited.text = "Customers \(counter)"
            
            for var i = 0; i <= counter - 1; i++ {
                customerPreference.append(Double(arc4random_uniform(UInt32(11))) / 10)
                println(customerPreference)
            }
            
            for customer in customerPreference {
                if customer < 0.4 && ratio >= 1 {
                    money += 1
                    customersPaided += 1
                    println("paid likes ratio 1+,  customer likes it srong")
                }
                else if customer > 0.6 && ratio < 1 {
                    money += 1
                    customersPaided += 1
                    println("paid likes it ratio is equal, customer likes it equal")
                }
                else if customer <= 0.6 && ratio < 1 {
                    money += 1
                    customersPaided += 1
                    println("paid likes it ratio weak, customer likes it weak")
                }
                else {
                    println("No payment")
                }
            }
            
            numberOfCustomersTodayLabel.text = "Sold \(customersPaided)"
            
            
            // reset mix count before calling updateUI
            mixLemonCount = 0
            mixIceCount = 0
            
            // update
            updateUI()
            customersPaided = 0

            
            

            
        } else  {
            showAlertWithText(message: "Mix your lemnoade first")
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
    
    func showAlertWithText (header : String = "Warning", message : String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func updateUI() {
        
        inventoryLemonLabel.text = "\(lemons) Lemon(s)"
        inventoryMoneyLabel.text = "$\(money)"
        inventoryIceLabel.text = "\(iceCubes) Ice cube(s)"
        
        purchaseIceCountLabel.text = "\(iceCubes)"
        purchaseLemonCountLabel.text = "\(lemons)"
        
        mixIceAvailabilityLabel.text = "\(mixIceCount)"
        mixLemonsAvailabilityLabel.text = "\(mixLemonCount)"
        


    }
    
    
}

