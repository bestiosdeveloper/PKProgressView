//
//  PKProgressView.swift
//  PKProgressView
//
//  Created by Pramod Kumar on 29/08/16.
//  Copyright © 2016 Pramod Kumar . All rights reserved.
//

import UIKit

@IBDesignable
open class PKProgressView: UIView {
    
    
    //MARK:- Private Properties
    //MARK:-
    fileprivate var progressViewAlpha : CGFloat = 1.0
    //private var trackView : UIView!
    fileprivate var progressView : UIView = UIView(frame: .zero)
    fileprivate var trackingImageView = UIImageView(frame: .zero)
    fileprivate var shouldSetPregressByAnimation: Bool = false
    
    fileprivate var trackingImageViewFrame: CGRect {

        var nX = max((self.frame.origin.x + (self.trackingViewWidth - (trackingImageSize.width / 2.0))), self.frame.origin.x)
        nX = min(nX, ((self.frame.origin.x + self.frame.size.width) - trackingImageSize.width))
        
        let nY = self.frame.origin.y - (trackingImageSize.height + 5.0)
        return CGRect(x: nX, y: nY, width: trackingImageSize.width, height: trackingImageSize.height)
    }
    
    //MARK:- Internal Properties
    //MARK:-
    override open var alpha : CGFloat {
        didSet {
            self.progressViewAlpha = self.alpha
            super.alpha = 1.0
        }
    }
    
    fileprivate var trackingViewWidth: CGFloat {
        return self.frame.size.width * self.progress
    }
    
    //MARK:- IBInspectable Properties
    //MARK:-
    @IBInspectable open var trackingImage : UIImage?  {
        didSet {
            self.addTrackImageView()
            self.trackingImageView.image = trackingImage
        }
    }
    
    @IBInspectable open var trackingImageSize : CGSize = CGSize(width: 25.0, height: 25.0)  {
        didSet {
            self.trackingImageView.frame = self.trackingImageViewFrame
        }
    }
    
    @IBInspectable open var trackTint : UIColor = UIColor.lightGray {
        didSet {
            self.backgroundColor = self.trackTint
        }
    }
    
    @IBInspectable open var progressTint : UIColor = UIColor.blue {
        didSet {
            self.progressView.backgroundColor = self.progressTint
        }
    }
    
    @IBInspectable open var trackBorderWidth : CGFloat = 0.0 {
        didSet {
            self.draw(self.frame)
        }
    }
    
    @IBInspectable open var progressBorderWidth : CGFloat = 0.0 {
        didSet {
            self.draw(self.frame)
        }
    }
    
    @IBInspectable open var trackBorderColor : UIColor = UIColor.lightGray {
        didSet {
            self.draw(self.frame)
        }
    }
    
    @IBInspectable open var progressBorderColor : UIColor = UIColor.blue {
        didSet {
            self.draw(self.frame)
        }
    }
    
    @IBInspectable open var minValue : CGFloat = 0.0
    @IBInspectable open var maxValue : CGFloat = 1.0
    
    @IBInspectable open var progress : CGFloat = 0.0 {
        //between minValue to maxValue
        didSet {
            self.progress = self.progress > self.maxValue ? self.maxValue : self.progress
            self.progress = self.progress < self.minValue ? self.minValue : self.progress
            if !self.shouldSetPregressByAnimation {
                self.draw(self.frame)
            }
        }
    }
    
    //MARK:- View Life Cycle
    //MARK:-
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.initialSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialSetup()
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if !self.shouldSetPregressByAnimation {
            self.updateTrackView()
        }
    }
    
    
    //MARK:- Methods
    //MARK:- Private
    fileprivate func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
            execute: closure
        )
    }
    
    fileprivate func initialSetup() {
        
            //set background
        self.backgroundColor = self.trackTint

        //add progress view on self
        self.addSubview(self.progressView)
        
        self.makeCornerRound()
    }
    
    fileprivate func addTrackImageView() {
        if let _ = self.trackingImage {
            self.trackingImageView.frame = self.trackingImageViewFrame
            self.superview?.addSubview(self.trackingImageView)
        }
    }
    
    fileprivate func makeCornerRound() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.borderWidth = self.trackBorderWidth
        self.layer.borderColor = self.trackBorderColor.cgColor
        self.layer.masksToBounds = true
        
        self.progressView.backgroundColor = self.progressTint
        self.progressView.layer.cornerRadius = self.frame.size.height / 2
        self.progressView.layer.borderWidth = self.progressBorderWidth
        self.progressView.layer.borderColor = self.progressBorderColor.cgColor
        self.progressView.layer.masksToBounds = true
    }
    
    fileprivate func updateTrackView() {
        
        self.progressView.frame = CGRect(x: 0.0, y: 0.0, width: self.trackingViewWidth, height: self.frame.size.height)
        self.trackingImageView.frame = self.trackingImageViewFrame
    }
    
    //MARK:- Public
    public func setProgress(progress: CGFloat, inSeconds: TimeInterval = 10.0) {
        if inSeconds <= 0.0 {
            self.shouldSetPregressByAnimation = false
            self.progress = progress
        }
        else {
            self.shouldSetPregressByAnimation = true
            self.progress = progress
            let scaleTrans = CGAffineTransform(scaleX: self.trackingViewWidth * 2.0, y: self.trackingViewWidth * 2.0)
            
            let trnslTrans = CGAffineTransform(translationX: (self.trackingViewWidth - self.trackingImageSize.width), y: 0.0)
            
            self.progressView.frame = CGRect(x: 0.0, y: 0.0, width: 1.0, height: self.frame.size.height)
            UIView.animate(withDuration: inSeconds, animations: {
                self.progressView.transform = scaleTrans
                self.trackingImageView.transform = trnslTrans
            })
        }
    }
}
