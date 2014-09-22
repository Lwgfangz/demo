//
//  ViewController.swift
//  demo_swift11
//
//  Created by Lwgfangz on 14-9-19.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

import UIKit
// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class My
{
    var a:Int;
    
    init(b:Int)
    {
        self.a = 1;
        println(b);
    }
    func cry()
    {
        var b:Int=9;
        b = 9;
        NSLog("asfd");
        var c = b;
    }
}



class ViewController: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var  a = My(b:3);
        a.cry();
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

