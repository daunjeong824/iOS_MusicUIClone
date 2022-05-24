//
//  UIImage+Extension.swift
//  ViewImages
//
//  Created by 정다운 on 2022/05/24.
//
import UIKit

enum SFSymbolKey: String {
    // 기능 버튼
    case Play = "play.fill"
    case Pause = "pause.fill"
    
    case Backward = "backward.fill"
    case Forward = "forward.fill"
    
    // 기타 아이콘
    case Wifi = "wifi"
    case Battery = "battery.75"
    // case: 3 histogram
    
    case QuoteBubble = "quote.bubble.fill"
    case ListBullet = "list.bullet"
    case RadioWaves = "dot.radiowaves.left.and.right"
    case PlusMagnify = "plus.magnifyingglass"
    // case: circle in arrow
    
}

extension UIImage {
    convenience init? (_ sfSymbolKey: SFSymbolKey) {
        self.init(systemName: sfSymbolKey.rawValue)
    }
    static let image = UIImage(named: "logoImage")
}

