//
//  ViewController.swift
//  AnimateDemo
//
//  Created by Gabriel Araujo on 08/12/15.
//  Copyright © 2015 Innuv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view1 = UIView(frame: CGRect(x: 50, y: 50, width: self.view.frame.size.width-100, height: 100))
        let view2 = UIView(frame: CGRect(x: 50, y: 50, width: 300, height: 100))
        let view3 = UIView(frame: CGRect(x: 50, y: 50, width: 300, height: 100))
        
        view1.backgroundColor = UIColor.blackColor()
        view2.backgroundColor = UIColor.blueColor()
        view3.backgroundColor = UIColor.redColor()
        
        //Animate.animateViewsDown([view1, view2, view3], _intoView: self.view, _botLimit: self.view.frame.size.height-200, _space: 50)
        //Animate.animateViewsRight([view1, view2, view3], _intoView: self.view, _y: 50, _space: 50)
        //Animate.animateViewsLeft([view1, view2, view3], _intoView: self.view, _y: 50, _space: 50)
        //Animate.animateViewsUp([view1, view2, view3], _intoView: self.view, _topLimit: 50, _space: 25)
        Animate.animatePopUpBoundries(view1, _intoView: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

