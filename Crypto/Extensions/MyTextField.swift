//
//  MyTextField.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import UIKit

class MyTextField: UITextField {
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
            } else {
                self.transform = CGAffineTransform.identity
            }
        }
    }

}
