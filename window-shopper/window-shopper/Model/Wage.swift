//
//  Wage.swift
//  window-shopper
//
//  Created by Yashasva Sharma on 24/02/22.
//

import Foundation

class Wage{
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
