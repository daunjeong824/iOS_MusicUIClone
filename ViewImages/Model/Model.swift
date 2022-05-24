//
//  Model.swift
//  ViewImages
//
//  Created by 정다운 on 2022/05/22.
// https://daeun28.github.io/ios%EC%82%AC%EC%9A%A9%EB%B2%95/post15/
import UIKit
import AVFoundation

protocol ModelDelegate : AnyObject {
    func modelDidFinishInitizePlayer(player: AVAudioPlayer)
}

class Model {
    var musicAsset: NSDataAsset!
    var player: AVAudioPlayer!
    //weak var delegate: ModelDelegate?
    
    init() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "Music") else {
            print("Sound Asset 가져올 수 없음.")
            return
        }
        self.musicAsset = soundAsset
        do {
            try self.player = AVAudioPlayer(data: self.musicAsset.data)
        } catch let error as NSError {
            print("Player 초기화 실패.")
            }
        //self.delegate?.modelDidFinishInitizePlayer(player: self.player)
    }

}
