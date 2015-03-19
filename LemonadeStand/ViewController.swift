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

