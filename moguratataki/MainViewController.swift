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
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "move", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func move() {
        //print(moguras.count)
        if moguras.count < 10 {
            let random = Int(arc4random_uniform(9))
            //モグラアニメーション
            let mogura = moguras[random]
            
            let moguraAnimation = CABasicAnimation(keyPath: "position.y")
            moguraAnimation.delegate = self
            moguraAnimation.duration = 0.5
            moguraAnimation.repeatCount = 1
            moguraAnimation.byValue = -50
            //moguraAnimation.fillMode = kCAFillModeRemoved
            moguraAnimation.autoreverses = true
            moguraAnimation.delegate = self
            moguraAnimation.setValue(mogura, forKey: "mogura")
            mogura.layer.addAnimation(moguraAnimation, forKey: "moguraAnimation")
            
            //moguras[random].backgroundColor = UIColor.blackColor()
        }
    }

    override func animationDidStart(anim: CAAnimation) {
        let mogura = anim.valueForKey("mogura") as! Mogura
        mogura.hitFlg = true
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        let mogura = anim.valueForKey("mogura") as! Mogura
        mogura.hitFlg = false
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
        
        //回転
        let hammerAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        hammerAnimation.duration = 0.2
        hammerAnimation.toValue = -2
        hammerAnimation.fillMode = kCAFillModeRemoved
        imgHammerView.layer.addAnimation(hammerAnimation, forKey: "hammerAnimation")

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
        let moguraWidth  = 50
        let moguraHeight = 50
        for y in 0...2 {
            for x in 0...2 {
                //モグラ配置
                let mogura = Mogura()
                mogura.frame = CGRectMake(CGFloat(10+(moguraWidth+50)*x), CGFloat(60+(moguraHeight+70)*y), CGFloat(moguraWidth), CGFloat(moguraHeight))
                self.view.addSubview(mogura)
                moguras.append(mogura)
                
                //隠れるやつ配置
                let yama:UIView = UIView(frame: CGRectMake(CGFloat(10+(moguraWidth+50)*x), CGFloat(60+(moguraHeight+70)*y), CGFloat(moguraWidth+5), CGFloat(moguraHeight+5)))
                yama.backgroundColor = UIColor.brownColor()
                self.view.addSubview(yama)
                num = num + 1
            }
        }
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
