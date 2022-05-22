//
//  Model.swift
//  ViewImages
//
//  Created by 정다운 on 2022/05/22.
// https://daeun28.github.io/ios%EC%82%AC%EC%9A%A9%EB%B2%95/post15/

import UIKit
import AVFoundation

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
    
    case QuoteBubble = "quote.bubble"
    case ListBullet = "list.bullet"
    case PlusMagnify = "plus.magnifyingglass"
    // case: circle in arrow
    
}

extension UIImage {
    convenience init? (_ sfSymbolKey: SFSymbolKey) {
        self.init(systemName: sfSymbolKey.rawValue)
    }
    static let image = UIImage(named: "logoImage")
}

class Model {
    var musicAsset: NSDataAsset?
    
    
    init() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "Music") else {
            print("Sound Asset 가져올 수 없음.")
            return
        }
        self.musicAsset = soundAsset
    }
    

}
