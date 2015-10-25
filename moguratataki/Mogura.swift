//
//  Mogura.swift
//  moguratataki
//
//  Created by 小林芳樹 on 2015/10/25.
//  Copyright © 2015年 小林芳樹. All rights reserved.
//

import UIKit

class Mogura: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    init() {
        super.init(frame: CGRectZero)
        self.backgroundColor = UIColor.blueColor()
        
        let aSelector = Selector("tapGesture:")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: aSelector)
        
        self.addGestureRecognizer(tapGestureRecognizer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func sampleMogura() {
        //print("mogura!!")
    }
    
    
    func tapGesture(gestureRecognizer: UITapGestureRecognizer) {
        print(self.backgroundColor)
        
        if self.backgroundColor == .blueColor() {
            self.backgroundColor = .redColor()
        }else{
            self.backgroundColor = .blueColor()
        }
    }


}
