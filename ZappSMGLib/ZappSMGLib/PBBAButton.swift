//
//  PBBAButton.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/9/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation

extension UIColor {
    
    public class func pbbaButtonBackgroundColor() -> UIColor {
        return UIColor(red: 255/255.0, green: 110/255.0, blue: 0, alpha: 1)
    }
}

extension UIImage {
    
    public class func ppbaImage(name: String) -> UIImage? {
        
        let libResourceBundleURL = NSBundle.mainBundle().URLForResource("ZappSMGLibResources", withExtension: "bundle")
        let libResourceBundle = NSBundle(URL: libResourceBundleURL!)
        let scale = Int(floor(UIScreen.mainScreen().scale))
        let imageNameSuffix = (scale > 1) ? String(format: "@%dx", arguments: [scale]) : ""
        let imageFinalName = name.stringByAppendingString(imageNameSuffix)
        let path = libResourceBundle?.pathForResource(imageFinalName, ofType: "png")
        
        let data = NSData(contentsOfFile: path!)
        let image = UIImage(data: data!, scale: CGFloat(scale))
        
        return image
    }
}

protocol Animatable {

    func isAnimating() -> Bool
    func startAnimating()
    func stopAnimating()
}

class PBBASquigleView: UIView, Animatable {
    
    var squiggleImageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let squiggleBaseImage = UIImage.ppbaImage("squiggle-part-15")?.imageWithRenderingMode(.AlwaysTemplate)
        squiggleImageView = UIImageView(image: squiggleBaseImage)
        
        guard let squiggleImageView = squiggleImageView else {
            return
        }
        
        squiggleImageView.tintColor = UIColor.whiteColor()
        squiggleImageView.translatesAutoresizingMaskIntoConstraints = false
        squiggleImageView.contentMode = .ScaleAspectFit
        squiggleImageView.animationDuration = 2.3
        
        self.addSubview(squiggleImageView)
        
        var animationImages = [UIImage]()
        
        for i in 0...47 {
            let imageName = String(format: "squiggle-part-%02d", arguments: [i])
            let image = UIImage.ppbaImage(imageName)?.imageWithRenderingMode(.AlwaysTemplate)
            animationImages.append(image!)
        }
        
        squiggleImageView.animationImages = animationImages
        
        let bindedViews = ["squiggleImageView" : squiggleImageView]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[squiggleImageView]|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindedViews))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[squiggleImageView]|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindedViews))
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func isAnimating() -> Bool {
        return (squiggleImageView?.isAnimating())!
    }
    
    func startAnimating() {
        squiggleImageView?.startAnimating()
    }
    
    func stopAnimating() {
        squiggleImageView?.stopAnimating()
    }
}

class PBBAButtonTitleView : UIView, Animatable {
    
    var titleImageView: UIImageView?
    var squiggleView: PBBASquigleView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        
        translatesAutoresizingMaskIntoConstraints = false
        userInteractionEnabled = true
        
        let titleImage = UIImage.ppbaImage("button-title-base")?.imageWithRenderingMode(.AlwaysTemplate)
        titleImageView = UIImageView(image: titleImage)
        
        guard let titleImageView = titleImageView else {
            return
        }
        
        titleImageView.tintColor = UIColor.whiteColor()
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        titleImageView.contentMode = .ScaleAspectFit
        
        squiggleView = PBBASquigleView(frame: CGRectZero)
        
        guard let squiggleView = squiggleView else {
            return
        }
        
        titleImageView.addSubview(squiggleView)
        self.addSubview(titleImageView)
        
        let bindedViews = ["titleImageView" : titleImageView, "squiggleView" : squiggleView]
        
        // Squiggle view aspect ration 1:1
        squiggleView.addConstraint(NSLayoutConstraint(item: squiggleView,
            attribute: .Height, relatedBy: .Equal, toItem: squiggleView, attribute: .Width, multiplier: 1, constant: 0))
        
        // Squiggle view height equal to title image view height
        titleImageView.addConstraint(NSLayoutConstraint(item: squiggleView,
            attribute: .Height, relatedBy: .Equal, toItem: titleImageView, attribute: .Height, multiplier: 1, constant: 0))
        
        // Maximum height for title image view - keep default
        let heightExpression = String(format: "V:[titleImageView(<=%f)]", CGRectGetHeight(titleImageView.bounds))
        titleImageView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(heightExpression,
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindedViews))
        
        // Title image view aspect ratio - keep default
        let multiplier = CGRectGetHeight(titleImageView.bounds) / CGRectGetWidth(titleImageView.bounds)
        titleImageView.addConstraint(NSLayoutConstraint(item: titleImageView,
            attribute: .Height, relatedBy: .Equal, toItem: titleImageView, attribute: .Width, multiplier: multiplier, constant: 0))

        // Align squiggle view in title image view
        titleImageView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(-3)-[squiggleView]",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindedViews))
        titleImageView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[squiggleView]",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindedViews))
        
        // Align title image view in self
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(>=5)-[titleImageView]-(>=5)-|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindedViews))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(>=5)-[titleImageView]-(>=5)-|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindedViews))
        addConstraint(NSLayoutConstraint(item: titleImageView,
            attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleImageView,
            attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return false
    }
    
    func isAnimating() -> Bool {
        return (squiggleView?.isAnimating())!
    }
    
    func startAnimating() {
        squiggleView?.startAnimating()
    }
    
    func stopAnimating() {
        squiggleView?.stopAnimating()
    }
}

@objc public class PPBAButton : UIControl, Animatable {
    
    /// Assign a tap handler closure
    public var tapHandler: ((PPBAButton) -> Void)?
    
    private var titleView: PBBAButtonTitleView?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        
        clipsToBounds = true
        layer.cornerRadius = 4.0
        backgroundColor = UIColor.pbbaButtonBackgroundColor()
        
        addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
        
        sendActionsForControlEvents(.ValueChanged)
        userInteractionEnabled = true
        isAccessibilityElement = true
        accessibilityIdentifier = "com.zapp.zpmzappbutton"
        accessibilityLabel = "Pay by bank app"
        
        titleView = PBBAButtonTitleView(frame: bounds)
        addSubview(titleView!)
        
        let bindedViews = ["buttonTitleView" : titleView!]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[buttonTitleView]|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindedViews))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[buttonTitleView]|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindedViews))
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    public override func accessibilityActivate() -> Bool {
        
        didTapButton(self)
        
        return true
    }
    
    func didTapButton(button: PPBAButton) {
        
        guard enabled else {
            return
        }
        
        if let tapHandler = tapHandler {
            enabled = false
            titleView?.startAnimating()
            tapHandler(button)
        }
    }
    
    public func isAnimating() -> Bool {
        return (titleView?.isAnimating())!
    }
    
    public func startAnimating() {
        titleView?.startAnimating()
    }
    
    public func stopAnimating() {
        titleView?.stopAnimating()
    }
}