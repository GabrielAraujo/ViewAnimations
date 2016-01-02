import UIKit

enum AnimationType {
    case bouncing
    case simple
}

class Animate {
    
    //Up
    class func viewsUp(views:[UIView], intoView:UIView, topLimit:CGFloat, space:CGFloat, type:AnimationType) {
        let topDist = intoView.frame.size.height
        views.forEach {
            $0.frame.origin = CGPoint(x: intoView.frame.size.width/2 - $0.frame.size.width/2, y: topDist)
        }
        Animate.animateUp(views, intoView: intoView, topLimit: topLimit, space: space, delay: 0.0, counter: 0, type: type)
        intoView.layoutIfNeeded()
    }
    
    class func viewUp(view:UIView, intoView:UIView, topLimit:CGFloat, type:AnimationType) {
        let topDist = intoView.frame.size.height
        view.frame.origin = CGPoint(x: intoView.frame.size.width/2 - view.frame.size.width/2, y: topDist)
        Animate.animateUp([view], intoView: intoView, topLimit: topLimit, space: 0.0, delay: 0.0, counter: 0, type: type)
        intoView.layoutIfNeeded()
    }
    
    
    private class func animateUp(views:[UIView], intoView:UIView, var topLimit:CGFloat, space:CGFloat, let delay:Double, var counter:Int, type:AnimationType) {
        intoView.addSubview(views[counter])
        switch type {
        case .bouncing:
            UIView.animateWithDuration(1.5, delay: delay,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.0,
                options: .CurveEaseOut,
                animations: {
                    views[counter].frame.origin = CGPoint(x: intoView.frame.size.width/2 - views[counter].frame.size.width/2, y: topLimit)
                    
                    if counter < views.count - 1 {
                        //delay += 0.2
                        topLimit += (space + views[counter].frame.size.height)
                        counter += 1
                        self.animateUp(views, intoView: intoView, topLimit: topLimit, space: space, delay: delay, counter: counter, type: type)
                    }
                    
                }, completion: { result in
                    //Finished
            })
            break
        case .simple:
            UIView.animateWithDuration(1.5, animations: { () -> Void in
                views[counter].frame.origin = CGPoint(x: intoView.frame.size.width/2 - views[counter].frame.size.width/2, y: topLimit)
                
                if counter < views.count - 1 {
                    //delay += 0.2
                    topLimit += (space + views[counter].frame.size.height)
                    counter += 1
                    self.animateUp(views, intoView: intoView, topLimit: topLimit, space: space, delay: delay, counter: counter, type: type)
                }
            }, completion: { (completed) -> Void in
                    //Finished
            })
            break
        }
        
    }
    
    //Down
    class func viewsDown(views:[UIView], intoView:UIView, botLimit:CGFloat, space:CGFloat, type:AnimationType) {
        var auxArray:[UIView] = []
        views.forEach {
            $0.frame.origin = CGPoint(x: intoView.frame.size.width/2 - $0.frame.size.width/2, y: -$0.frame.size.height)
            auxArray.insert($0, atIndex: 0)
        }
        Animate.animateDown(auxArray, intoView: intoView, botLimit: botLimit, space: space, delay: 0.0, counter: 0, type: type)
        intoView.layoutIfNeeded()
    }
    
    class func viewDown(view:UIView, intoView:UIView, botLimit:CGFloat, type:AnimationType) {
        view.frame.origin = CGPoint(x: intoView.frame.size.width/2 - view.frame.size.width/2, y: -view.frame.size.height)
        Animate.animateDown([view], intoView: intoView, botLimit: botLimit, space: 0.0, delay: 0.0, counter: 0, type: type)
        intoView.layoutIfNeeded()
    }
    
    
    private class func animateDown(views:[UIView], intoView:UIView, var botLimit:CGFloat, space:CGFloat, let delay:Double, var counter:Int, type:AnimationType) {
        intoView.addSubview(views[counter])
        switch type {
        case .bouncing:
            UIView.animateWithDuration(1.5, delay: delay,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.0,
                options: .CurveEaseOut,
                animations: {
                    views[counter].frame.origin = CGPoint(x: intoView.frame.size.width/2 - views[counter].frame.size.width/2, y: botLimit - views[counter].frame.size.height)
                    
                    if counter < views.count - 1 {
                        //delay += 0.2
                        botLimit -= (space + views[counter].frame.size.height)
                        counter += 1
                        self.animateDown(views, intoView: intoView, botLimit: botLimit, space: space, delay: delay, counter: counter, type: type)
                    }
                    
                }, completion: { result in
                    
            })
            break
        case .simple:
            UIView.animateWithDuration(1.5, animations: { () -> Void in
                views[counter].frame.origin = CGPoint(x: intoView.frame.size.width/2 - views[counter].frame.size.width/2, y: botLimit - views[counter].frame.size.height)
                
                if counter < views.count - 1 {
                    //delay += 0.2
                    botLimit -= (space + views[counter].frame.size.height)
                    counter += 1
                    self.animateDown(views, intoView: intoView, botLimit: botLimit, space: space, delay: delay, counter: counter, type: type)
                }
            }, completion: { (completed) -> Void in
                //Finished
            })
            break
        }
        
    }
    
    //Left
    class func viewsLeft(views:[UIView], intoView:UIView, y:CGFloat, space:CGFloat, type:AnimationType) {
        var auxY = y
        views.forEach {
            $0.frame.origin = CGPoint(x: intoView.frame.size.width, y: auxY)
            auxY += (space + $0.frame.size.height)
        }
        Animate.animateLeft(views, intoView: intoView, y: y, space: space, delay: 0.0, counter: 0, type: type)
        intoView.layoutIfNeeded()
    }
    
    class func viewLeft(view:UIView, intoView:UIView, y:CGFloat, type:AnimationType) {
        var auxY = y
        view.frame.origin = CGPoint(x: intoView.frame.size.width, y: auxY)
        auxY += (0.0 + view.frame.size.height)
        Animate.animateLeft([view], intoView: intoView, y: y, space: 0.0, delay: 0.0, counter: 0, type: type)
        intoView.layoutIfNeeded()
    }
    
    
    private class func animateLeft(views:[UIView], intoView:UIView, var y:CGFloat, space:CGFloat, var delay:Double, var counter:Int, type:AnimationType) {
        intoView.addSubview(views[counter])
        switch type {
        case .bouncing:
            UIView.animateWithDuration(1.5, delay: delay,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.0,
                options: .CurveEaseOut,
                animations: {
                    views[counter].frame.origin = CGPoint(x: intoView.frame.size.width/2 - views[counter].frame.size.width/2, y: y)
                    if counter < views.count - 1 {
                        delay += 0.2
                        y += (space + views[counter].frame.size.height)
                        counter += 1
                        self.animateLeft(views, intoView: intoView, y: y, space: space, delay: delay, counter: counter, type: type)
                    }
                }, completion: { result in
                    
            })
            break
        case .simple:
            UIView.animateWithDuration(1.5, animations: { () -> Void in
                views[counter].frame.origin = CGPoint(x: intoView.frame.size.width/2 - views[counter].frame.size.width/2, y: y)
                if counter < views.count - 1 {
                    delay += 0.2
                    y += (space + views[counter].frame.size.height)
                    counter += 1
                    self.animateLeft(views, intoView: intoView, y: y, space: space, delay: delay, counter: counter, type: type)
                }
            }, completion: { (completed) -> Void in
                
            })
            break
        }
        
    }
    
    //Right
    class func viewsRight(views:[UIView], intoView:UIView, y:CGFloat, space:CGFloat, type:AnimationType) {
        var auxY = y
        views.forEach {
            $0.frame.origin = CGPoint(x: -$0.frame.size.width, y: auxY)
            auxY += (space + $0.frame.size.height)
        }
        Animate.animateRight(views, intoView: intoView, y: y, space: space, delay: 0.0, counter: 0, type: type)
        intoView.layoutIfNeeded()
    }
    
    class func viewRight(view:UIView, intoView:UIView, y:CGFloat, type:AnimationType) {
        var auxY = y
        view.frame.origin = CGPoint(x: -view.frame.size.width, y: auxY)
        auxY += (0.0 + view.frame.size.height)
        Animate.animateRight([view], intoView: intoView, y: y, space: 0.0, delay: 0.0, counter: 0, type: type)
        intoView.layoutIfNeeded()
    }
    
    
    private class func animateRight(views:[UIView], intoView:UIView, var y:CGFloat, space:CGFloat, var delay:Double, var counter:Int, type:AnimationType) {
        intoView.addSubview(views[counter])
        switch type {
        case .bouncing:
            UIView.animateWithDuration(1.5, delay: delay,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.0,
                options: .CurveEaseOut,
                animations: {
                    views[counter].frame.origin = CGPoint(x: intoView.frame.size.width/2 - views[counter].frame.size.width/2, y: y)
                    
                    if counter < views.count - 1 {
                        delay += 0.2
                        y += (space + views[counter].frame.size.height)
                        counter += 1
                        self.animateLeft(views, intoView: intoView, y: y, space: space, delay: delay, counter: counter, type: type)
                    }
                    
                }, completion: { result in
                    
            })
            break
        case .simple:
            UIView.animateWithDuration(1.5, animations: { () -> Void in
                views[counter].frame.origin = CGPoint(x: intoView.frame.size.width/2 - views[counter].frame.size.width/2, y: y)
                
                if counter < views.count - 1 {
                    delay += 0.2
                    y += (space + views[counter].frame.size.height)
                    counter += 1
                    self.animateLeft(views, intoView: intoView, y: y, space: space, delay: delay, counter: counter, type: type)
                }
            }, completion: { (completed) -> Void in
                    
            })
            break
        }
        
    }
    
    //Popup
    class func popIn(view:UIView, intoView:UIView) {
        let rect = view.frame
        view.frame = CGRect(x: rect.size.width/2, y: rect.size.height/2, width: 0, height: 0)
        intoView.addSubview(view)
        UIView.animateWithDuration(1.5, delay: 0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.2,
            options: .CurveEaseOut,
            animations: {
                view.frame = rect
                
            }, completion: { result in
                //Finished
        })
    }
    
    class func popOut(view:UIView, intoView:UIView) {
        UIView.animateWithDuration(1.5, animations: { () -> Void in
            view.frame = CGRect(x: view.frame.size.width/2, y: view.frame.size.height/2, width: 0, height: 0)
            }) { (completed) -> Void in
                //Finished
        }
    }
}