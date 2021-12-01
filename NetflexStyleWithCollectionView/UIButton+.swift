//
//  UIButton+.swift
//  NetflexStyleWithCollectionView
//
//  Created by YONGCHEOL LEE on 2021/12/01.
//

import UIKit

extension UIButton {
    func adjustVerticalLayout(_ spacing: CGFloat = 0) {
        let imageSize = imageView?.frame.size ?? .zero
        let titleLabelSize = titleLabel?.frame.size ?? .zero
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)
        imageEdgeInsets  = UIEdgeInsets(top: -(titleLabelSize.height + spacing), left: 0, bottom: 0, right: -titleLabelSize.width)
    }
}
