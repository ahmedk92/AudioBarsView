//
//  AudioBarsView.swift
//  AudioBars
//
//  Created by Arabia -IT on 2/7/18.
//  Copyright © 2018 Arabia-IT. All rights reserved.
//

import UIKit

extension Collection {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

@IBDesignable
class AudioBarsView: UIView {
    
    @IBInspectable var color: UIColor = .red
    @IBInspectable var barCount: Int = 1 
    @IBInspectable var barGap: CGFloat = 0
    private lazy var powerValues = { [unowned self] in
        return RecentNArray<CGFloat>(n: self.barCount)
    }()
    private var bars = [UIView]()
    private var barHeightConstraints: [NSLayoutConstraint] = []
    
    func append(power: CGFloat) {
        powerValues.append(newElement: power)
        animateChanges()
    }
    
    private func animateChanges() {
        UIView.animate(withDuration: 0.2) {
            for i in 0..<self.powerValues.array.count {
                self.barHeightConstraints[i].constant = self.powerValues.array[i] * self.frame.size.height
            }
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    override func layoutSubviews() {
        if bars.count != barCount {
            for bar in bars {
                bar.removeFromSuperview()
            }
            bars = []
            for i in 0..<barCount {
                let bar = UIView()
                bar.backgroundColor = color
                bar.translatesAutoresizingMaskIntoConstraints = false
                bar.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
                addSubview(bar)
                let leading = NSLayoutConstraint.init(item: bar, attribute: .leading, relatedBy: .equal, toItem: i == 0 ? self : bars[i - 1], attribute: i == 0 ? .leading : .trailing, multiplier: 1.0, constant: i == 0 ? 0 : self.barGap)
                let bottom = NSLayoutConstraint.init(item: bar, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
                if i > 0 && i < barCount {
                    self.addConstraint(NSLayoutConstraint.init(item: bar, attribute: .width, relatedBy: .equal, toItem: self.bars[i - 1], attribute: .width, multiplier: 1.0, constant: 0))
                }
                if i == barCount - 1 {
                    self.addConstraint(NSLayoutConstraint.init(item: bar, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0))
                }
                self.addConstraints([leading, bottom])

                let height = NSLayoutConstraint.init(item: bar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0)
                
                bar.addConstraint(height)
                barHeightConstraints.append(height)
                bars.append(bar)
            }
        } else {
            super.layoutSubviews()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
