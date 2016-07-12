//
//  CurrencyAmount.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/8/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation

public func + (left: CurrencyAmount, right: CurrencyAmount) -> CurrencyAmount? {
    
    guard left.currencyCode == right.currencyCode else {
        return nil
    }
    
    return CurrencyAmount(value: left.value + right.value, currencyCode: left.currencyCode)
}

public func - (left: CurrencyAmount, right: CurrencyAmount) -> CurrencyAmount? {
    
    guard left.currencyCode == right.currencyCode else {
        return nil
    }
    
    return CurrencyAmount(value: left.value - right.value, currencyCode: left.currencyCode)
}

@objc public class CurrencyAmount: NSObject, Validatable {
    
    /// The default currency code.
    public static let Pounds: String = "GBP"
    
    /// The currency value.
    public var value: CLong
    
    /// The currency code
    public var currencyCode: String
    
    public init(value: CLong, currencyCode: String?) {
        
        self.value = value
        self.currencyCode = currencyCode ?? CurrencyAmount.Pounds
    }
    
    public convenience init(value: CLong) {
        
        self.init(value: value, currencyCode: nil)
    }
    
    /**
     Add the given currency amount to the current one.
     
     - parameter currencyAmount: The currency amount to be added.
     
     - returns: the result of currency amount after adding.
     */
    public func add(currencyAmount: CurrencyAmount) -> CurrencyAmount? {
        
        guard self.currencyCode == currencyAmount.currencyCode else {
            return nil
        }
        
        value += currencyAmount.value
        
        return self
    }
    
    /**
     Subtracts the given currency amount from the current one.
     
     - parameter currencyAmount: The currency amount to be subtracted
     
     - returns: the result of currency amount after subtraction
     */
    public func substract(currencyAmount: CurrencyAmount) -> CurrencyAmount? {
        
        guard self.currencyCode == currencyAmount.currencyCode else {
            return nil
        }
        
        value -= currencyAmount.value
        
        return self
    }
    
    /**
      Multiply the current currency amount with the given quantity.
     
     - parameter quantity: The quantity to multiply with.
     
     - returns: the result of currency amount after multiplication.
     */
    public func multiplyByQuantity(quantity: Int) -> CurrencyAmount {
        
        value *= quantity
        
        return self
    }
    
    /**
     Get the amount as string.
     
     - returns: The String representation of the amount.
     */
    public func displayString() -> String? {
        
        guard CurrencyAmount.Pounds == currencyCode else {
            return nil
        }
        
        var displayString: String
        let sign = value >= 0 ? "" : "-"
        let poundsValue = abs(value / 100)
        let penceValue = abs(value % 100)
        
        if poundsValue != 0 {
            displayString = String(format: "%s\u{00a3}%d.%02d", arguments: [sign, poundsValue, penceValue])
        } else {
            displayString = String(format: "%s%dp", arguments: [sign, penceValue])
        }
        
        return displayString
    }
    
    /**
     Execute validation.
     
     - throws: ZappModelValidationError
     */
    public func validate() throws {
        // No extra validation required
    }
}