//
//  ViewController.swift
//  ViewImages
//
//  Created by 정다운 on 2022/05/21.
//

import UIKit

class ViewController: ViewSet {
    // MARK: property
    var gradientLayer: CAGradientLayer!
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
        
        
        addGradient()
        self.playPauseButton.addTarget(self, action: #selector(touchUpPlayButton(_:)), for: UIControl.Event.touchUpInside)
        
        let safeAreaGuide = self.view.safeAreaLayoutGuide
        self.view.addSubview(musicView)
        self.addSubViewToMusicView()
        
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

    // MARK: Event Handler
    @objc func touchUpPlayButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.model.player?.play()
        } else {
            self.model.player?.pause()
        }
    }
}

// MARK: Delegate Implementation
/*extension ViewController: ModelDelegate {
    func modelDidFinishInitizePlayer(player: AVAudioPlayer) {
        // Progress Bar 초기화 시작
        if self
    }
}*/
