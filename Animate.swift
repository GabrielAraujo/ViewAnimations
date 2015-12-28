import UIKit

class Animate {
    
    //Up
    class func viewsUp(_views:[UIView], _intoView:UIView, _topLimit:CGFloat, _space:CGFloat) {
        let topDist = _intoView.frame.size.height
        _views.forEach {
            $0.frame.origin = CGPoint(x: _intoView.frame.size.width/2 - $0.frame.size.width/2, y: topDist)
        }
        Animate.animateUp(_views, _intoView: _intoView, _topLimit: _topLimit, _space: _space, delay: 0.0, counter: 0)
        _intoView.layoutIfNeeded()
    }
    
    class func viewUp(_view:UIView, _intoView:UIView, _topLimit:CGFloat) {
        let topDist = _intoView.frame.size.height
        _view.frame.origin = CGPoint(x: _intoView.frame.size.width/2 - _view.frame.size.width/2, y: topDist)
        Animate.animateUp([_view], _intoView: _intoView, _topLimit: _topLimit, _space: 0.0, delay: 0.0, counter: 0)
        _intoView.layoutIfNeeded()
    }
    
    
    private class func animateUp(_views:[UIView], _intoView:UIView, var _topLimit:CGFloat, _space:CGFloat, let delay:Double, var counter:Int) {
        _intoView.addSubview(_views[counter])
        UIView.animateWithDuration(1.5, delay: delay,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.0,
            options: .CurveEaseOut,
            animations: {
            _views[counter].frame.origin = CGPoint(x: _intoView.frame.size.width/2 - _views[counter].frame.size.width/2, y: _topLimit)
                
                if counter < _views.count - 1 {
                    //delay += 0.2
                    _topLimit += (_space + _views[counter].frame.size.height)
                    counter += 1
                    self.animateUp(_views, _intoView: _intoView, _topLimit: _topLimit, _space: _space, delay: delay, counter: counter)
                }
                
            }, completion: { result in
                
        })
    }
    
    //Down
    class func viewsDown(_views:[UIView], _intoView:UIView, _botLimit:CGFloat, _space:CGFloat) {
        var auxArray:[UIView] = []
        _views.forEach {
            $0.frame.origin = CGPoint(x: _intoView.frame.size.width/2 - $0.frame.size.width/2, y: -$0.frame.size.height)
            auxArray.insert($0, atIndex: 0)
        }
        Animate.animateDown(auxArray, _intoView: _intoView, _botLimit: _botLimit, _space: _space, delay: 0.0, counter: 0)
        _intoView.layoutIfNeeded()
    }
    
    class func viewDown(_view:UIView, _intoView:UIView, _botLimit:CGFloat) {
        _view.frame.origin = CGPoint(x: _intoView.frame.size.width/2 - _view.frame.size.width/2, y: -_view.frame.size.height)
        Animate.animateDown([_view], _intoView: _intoView, _botLimit: _botLimit, _space: 0.0, delay: 0.0, counter: 0)
        _intoView.layoutIfNeeded()
    }
    
    
    private class func animateDown(_views:[UIView], _intoView:UIView, var _botLimit:CGFloat, _space:CGFloat, let delay:Double, var counter:Int) {
        _intoView.addSubview(_views[counter])
        UIView.animateWithDuration(1.5, delay: delay,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.0,
            options: .CurveEaseOut,
            animations: {
                _views[counter].frame.origin = CGPoint(x: _intoView.frame.size.width/2 - _views[counter].frame.size.width/2, y: _botLimit - _views[counter].frame.size.height)
                
                if counter < _views.count - 1 {
                    //delay += 0.2
                    _botLimit -= (_space + _views[counter].frame.size.height)
                    counter += 1
                    self.animateDown(_views, _intoView: _intoView, _botLimit: _botLimit, _space: _space, delay: delay, counter: counter)
                }
                
            }, completion: { result in
                
        })
    }
    
    //Left
    class func viewsLeft(_views:[UIView], _intoView:UIView, _y:CGFloat, _space:CGFloat) {
        var auxY = _y
        _views.forEach {
            $0.frame.origin = CGPoint(x: _intoView.frame.size.width, y: auxY)
            auxY += (_space + $0.frame.size.height)
        }
        Animate.animateLeft(_views, _intoView: _intoView, _y: _y, _space: _space, delay: 0.0, counter: 0)
        _intoView.layoutIfNeeded()
    }
    
    class func viewLeft(_view:UIView, _intoView:UIView, _y:CGFloat) {
        var auxY = _y
        _view.frame.origin = CGPoint(x: _intoView.frame.size.width, y: auxY)
        auxY += (0.0 + _view.frame.size.height)
        Animate.animateLeft([_view], _intoView: _intoView, _y: _y, _space: 0.0, delay: 0.0, counter: 0)
        _intoView.layoutIfNeeded()
    }
    
    
    private class func animateLeft(_views:[UIView], _intoView:UIView, var _y:CGFloat, _space:CGFloat, var delay:Double, var counter:Int) {
        _intoView.addSubview(_views[counter])
        UIView.animateWithDuration(1.5, delay: delay,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.0,
            options: .CurveEaseOut,
            animations: {
                _views[counter].frame.origin = CGPoint(x: _intoView.frame.size.width/2 - _views[counter].frame.size.width/2, y: _y)
                if counter < _views.count - 1 {
                    delay += 0.2
                    _y += (_space + _views[counter].frame.size.height)
                    counter += 1
                    self.animateLeft(_views, _intoView: _intoView, _y: _y, _space: _space, delay: delay, counter: counter)
                }
            }, completion: { result in
                
        })
    }
    
    //Right
    class func viewsRight(_views:[UIView], _intoView:UIView, _y:CGFloat, _space:CGFloat) {
        var auxY = _y
        _views.forEach {
            $0.frame.origin = CGPoint(x: -$0.frame.size.width, y: auxY)
            auxY += (_space + $0.frame.size.height)
        }
        Animate.animateRight(_views, _intoView: _intoView, _y: _y, _space: _space, delay: 0.0, counter: 0)
        _intoView.layoutIfNeeded()
    }
    
    class func viewRight(_view:UIView, _intoView:UIView, _y:CGFloat) {
        var auxY = _y
        _view.frame.origin = CGPoint(x: -_view.frame.size.width, y: auxY)
        auxY += (0.0 + _view.frame.size.height)
        Animate.animateRight([_view], _intoView: _intoView, _y: _y, _space: 0.0, delay: 0.0, counter: 0)
        _intoView.layoutIfNeeded()
    }
    
    
    private class func animateRight(_views:[UIView], _intoView:UIView, var _y:CGFloat, _space:CGFloat, var delay:Double, var counter:Int) {
        _intoView.addSubview(_views[counter])
        UIView.animateWithDuration(1.5, delay: delay,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.0,
            options: .CurveEaseOut,
            animations: {
                _views[counter].frame.origin = CGPoint(x: _intoView.frame.size.width/2 - _views[counter].frame.size.width/2, y: _y)
                
                if counter < _views.count - 1 {
                    delay += 0.2
                    _y += (_space + _views[counter].frame.size.height)
                    counter += 1
                    self.animateLeft(_views, _intoView: _intoView, _y: _y, _space: _space, delay: delay, counter: counter)
                }
                
            }, completion: { result in
                
        })
    }
    
    //Popup
    class func popIn(_view:UIView, _intoView:UIView) {
        let rect = _view.frame
        _view.frame = CGRect(x: rect.size.width/2, y: rect.size.height/2, width: 0, height: 0)
        _intoView.addSubview(_view)
        UIView.animateWithDuration(1.5, delay: 0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.2,
            options: .CurveEaseOut,
            animations: {
                _view.frame = rect
                
            }, completion: { result in
                //Finished
        })
    }
    
    class func popOut(_view:UIView, _intoView:UIView) {
        UIView.animateWithDuration(1.5, animations: { () -> Void in
            _view.frame = CGRect(x: _view.frame.size.width/2, y: _view.frame.size.height/2, width: 0, height: 0)
            }) { (completed) -> Void in
                //Finished
        }
    }
}