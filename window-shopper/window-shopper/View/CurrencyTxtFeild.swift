//
//  CurrencyTxtFeild.swift
//  window-shopper
//
//  Created by Yashasva Sharma on 23/02/22.
//

import UIKit

@IBDesignable

class CurrencyTxtFeild: UITextField {
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20
        let currencyLbl = UILabel(frame: CGRect(x: 5, y: (frame.size.height/2) - size/2, width: size, height: size))
        currencyLbl.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        currencyLbl.textAlignment = .center
        currencyLbl.textColor = .gray
        currencyLbl.layer.cornerRadius = 5.0
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        currencyLbl.clipsToBounds = true
        currencyLbl.text = formatter.currencySymbol
        addSubview(currencyLbl)
    }
    override func prepareForInterfaceBuilder() {
        super.awakeFromNib()
        customizeView()
    }
    
    override func awakeFromNib() {
        customizeView()
    }
    
    
    
    func customizeView (){
            backgroundColor = UIColor(white: 1, alpha: 0.25)
            layer.cornerRadius = 5.0
            textAlignment = .center
            clipsToBounds = true
        
            if let p = placeholder{
                let place = NSAttributedString(string: p, attributes: [.foregroundColor: UIColor.white])
                attributedPlaceholder = place
            }
            
    }
}

