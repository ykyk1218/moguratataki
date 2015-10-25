//
//  MainViewController.swift
//  moguratataki
//
//  Created by 小林芳樹 on 2015/10/25.
//  Copyright © 2015年 小林芳樹. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var moguras:Array<Mogura> = []
    let imgHammerView = UIImageView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let lblTitle:UILabel = UILabel(frame: CGRectMake(0,30,100,20))
        lblTitle.text = "hogehoge"
        
        imgHammerView.frame = CGRectMake(0,0,50,70)
        let imgHammer = UIImage(named: "picopicohammer.png")
        imgHammerView.image = imgHammer
        
        self.setMogura()
        self.view.addSubview(lblTitle)
        self.view.addSubview(imgHammerView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touch began!!")
        let touchEvent = touches.first!
        
        let newDx = touchEvent.locationInView(self.view).x
        let newDy = touchEvent.locationInView(self.view).y
        
        var viewFrame: CGRect = imgHammerView.frame
        
        viewFrame.origin.x = newDx
        viewFrame.origin.y = newDy
        imgHammerView.frame = viewFrame
        
        self.view.addSubview(imgHammerView)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touchEvent = touches.first!
        
        let preDx = touchEvent.previousLocationInView(self.view).x
        let preDy = touchEvent.previousLocationInView(self.view).y
        
        let newDx = touchEvent.locationInView(self.view).x
        let newDy = touchEvent.locationInView(self.view).y
        
        let dx = newDx - preDx
        let dy = newDy - preDy
        
        var viewFrame: CGRect = imgHammerView.frame
        
        viewFrame.origin.x += dx
        viewFrame.origin.y += dy
        imgHammerView.frame = viewFrame
        
        self.view.addSubview(imgHammerView)
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    private func setMogura() {
        var num: Int = 0
        let moguraWidth  = 30
        let moguraHeight = 30
        for y in 0...2 {
            for x in 0...2 {
                let mogura = Mogura()
                mogura.frame = CGRectMake(CGFloat(10+(moguraWidth+30)*x), CGFloat(60+(moguraHeight+30)*y), CGFloat(moguraWidth), CGFloat(moguraHeight))
                print(mogura.frame)
                mogura.sampleMogura()
                self.view.addSubview(mogura)
            
                moguras.append(mogura)
                num = num + 1
            }
        }
    }
    
    private func animateMogura() {
        let random = Int(arc4random_uniform(10))
        moguras[random].backgroundColor = UIColor.blackColor()
        print("wawawa")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
