//
//  MyButton.swift
//  Crypto
//
//  Created by Artem Alekseev on 04.03.2023.
//

import UIKit

class MyButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            } else {
                self.transform = CGAffineTransform.identity
            }
        }
    }
}
