//
//  ViewController.swift
//  ViewImages
//
//  Created by 정다운 on 2022/05/21.
//

import UIKit
import AVFAudio

class ViewController: ViewSet {
    // MARK: property
    var gradientLayer: CAGradientLayer!
    var timer: Timer!
    var totalTime: [Int]!
    private let model = Model()
    
    func addSubViewToMusicView() {
        self.musicView.addSubview(middleStateBar)
        self.musicView.addSubview(imageView)
        self.musicView.addSubview(middleIcon)
        self.musicView.addSubview(progressSliderView)
        self.musicView.addSubview(progressText)
        self.musicView.addSubview(playPauseButton)
        self.musicView.addSubview(backWard)
        self.musicView.addSubview(foreWard)
        self.musicView.addSubview(volumeSlider)
        self.musicView.addSubview(footerImageSet)
    }
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get runtime-var & set eventHandler
        addGradient()
        self.playPauseButton.addTarget(self, action: #selector(touchUpPlayButton(_:)), for: UIControl.Event.touchUpInside)
        self.progressSliderView.addTarget(self, action: #selector(ChangeProgressSlider(_:)), for: UIControl.Event.valueChanged)
        
        let aTotalTime = GetTimeLabelText(time: self.model.player.duration)
        totalTime = aTotalTime
        ChangeLabelsInView(view: progressText, index: 1, toChangeText: "-\(totalTime[0]):\(totalTime[1])")
        // set initial config
        progressSliderView.maximumValue = Float(self.model.player.duration)
        progressSliderView.minimumValue = 0
        progressSliderView.value = Float(self.model.player.currentTime)
        
        let safeAreaGuide = self.view.safeAreaLayoutGuide
        self.view.addSubview(musicView)
        self.addSubViewToMusicView()
        self.model.player.delegate = self
        
        NSLayoutConstraint.activate([
            musicView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            musicView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            musicView.widthAnchor.constraint(equalTo: view.widthAnchor),
            musicView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: musicView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: musicView.centerYAnchor, constant: -160.0),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            middleStateBar.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 70),
            middleStateBar.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            middleStateBar.leadingAnchor.constraint(equalTo: musicView.leadingAnchor, constant: 30),
            middleStateBar.heightAnchor.constraint(equalToConstant: 25),
            
            middleIcon.trailingAnchor.constraint(equalTo: musicView.trailingAnchor, constant: -30),
            middleIcon.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
            middleIcon.widthAnchor.constraint(equalToConstant: 25),
            middleIcon.heightAnchor.constraint(equalToConstant: 25),
            
            progressSliderView.topAnchor.constraint(equalTo: middleStateBar.bottomAnchor, constant: 30),
            progressSliderView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 32 ),
            progressSliderView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -32),
            
            progressText.topAnchor.constraint(equalTo: progressSliderView.bottomAnchor, constant: 1),
            progressText.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 32),
            progressText.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -32),
            playPauseButton.topAnchor.constraint(equalTo: progressSliderView.bottomAnchor, constant: 60),
            playPauseButton.centerXAnchor.constraint(equalTo: musicView.centerXAnchor),
            
            backWard.topAnchor.constraint(equalTo: playPauseButton.topAnchor, constant: 10),
            backWard.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 45),
            foreWard.topAnchor.constraint(equalTo: playPauseButton.topAnchor, constant: 10),
            foreWard.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -45),
            
            // no volume
            volumeSlider.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 290),
            volumeSlider.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 45),
            volumeSlider.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -45),
            // imgSet
            footerImageSet.leadingAnchor.constraint(equalTo:safeAreaGuide.leadingAnchor,
                                                   constant: 60),
            footerImageSet.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -60),
            footerImageSet.topAnchor.constraint(equalTo: volumeSlider.bottomAnchor, constant: 15)
        ])
    }
    // MARK: Custom Func
    func addGradient() {
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.view.bounds
        self.gradientLayer.colors = [UIColor.systemGray.cgColor,  UIColor(red: 0.6588, green: 0.3922, blue: 0, alpha: 1.0).cgColor, UIColor.systemGray.cgColor]
        self.view.layer.addSublayer(gradientLayer)
    }

    func GetTimeLabelText(time: TimeInterval) -> [Int] {
        let minute = Int(time / 60)
        let second = Int(time.truncatingRemainder(dividingBy: 60))
        let result: [Int] = [minute, second]
        return result
    }
    
    func ChangeLabelsInView(view: UIView, index: Int, toChangeText: String) {
        var count: Int = 0
        for subView in view.subviews as [UIView] {
            if let labelView = subView as? UILabel {
                if count == index {
                    // 1 =< Second < 10, 앞에 0 추가
                    labelView.text = toChangeText
                }
            }
            count += 1
        }
    }
    
    func MakeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block:
            // Closure
            { [unowned self] (timer: Timer) in
            
            if progressSliderView.isTracking { return }
            let currentTime = GetTimeLabelText(time: self.model.player.currentTime)
            let calcTime = self.model.player.duration - self.model.player.currentTime
            let reminderTime = GetTimeLabelText(time: calcTime)
            
            ChangeLabelsInView(view: progressText, index: 0, toChangeText: "\(currentTime[0]):\(currentTime[1])")
            ChangeLabelsInView(view: progressText, index: 1, toChangeText: "-\(reminderTime[0]):\(reminderTime[1])")
            progressSliderView.value = Float(self.model.player.currentTime)
        })
        self.timer.fire()
    }
    
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }

    // MARK: Event Handler
    @objc func touchUpPlayButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.model.player?.play()
        } else {
            self.model.player?.pause()
        }
        
        if sender.isSelected {
            self.MakeAndFireTimer()
        } else {
            self.invalidateTimer()
        }
    }
    @objc func ChangeProgressSlider(_ sender: UISlider) {
        let toChangeTime = GetTimeLabelText(time: TimeInterval(sender.value))
        let calcTime = self.model.player.duration - TimeInterval(sender.value)
        let reminderTime = GetTimeLabelText(time: calcTime)
        
        ChangeLabelsInView(view: progressText, index: 0, toChangeText: "\(toChangeTime[0]):\(toChangeTime[1])")
        ChangeLabelsInView(view: progressText, index: 1, toChangeText: "-\(reminderTime[0]):\(reminderTime[1])")
        if sender.isTracking { return }
        self.model.player.currentTime = TimeInterval(sender.value)
    }
}

// MARK: AVAudioPlayer Delegate
extension ViewController: AVAudioPlayerDelegate {
    // ProgressBar가 끝에 닿으면 호출 ( Model Delegate? )
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            playPauseButton.isSelected = false
                }
        self.progressSliderView.value = 0
        ChangeLabelsInView(view: progressText, index: 0, toChangeText: "0:00")
        ChangeLabelsInView(view: progressText, index: 1, toChangeText: "-\(totalTime[0]):\(totalTime[1])")
    }
}
