//
//  ViewController.swift
//  demo_swift
//
//  Created by Lwgfangz on 14-7-17.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
                            
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet var textField : UITextField
    @IBAction func action(sender : AnyObject)
    {
        textField.text = "4";
        //UIView *view = []
    }
    @IBOutlet var button_act : UIButton
}

