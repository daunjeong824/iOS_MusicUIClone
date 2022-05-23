//
//  ViewController.swift
//  ViewImages
//
//  Created by 정다운 on 2022/05/21.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: property
    // Main property
    var playPauseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let playImage = UIImage(systemName: SFSymbolKey.Play.rawValue,
            withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: 40, weight: .bold, scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(playImage, for: UIControl.State.normal)
        
        let pauseImage = UIImage(systemName: SFSymbolKey.Pause.rawValue, withConfiguration: UIImage.SymbolConfiguration(
            pointSize: 50, weight: .bold, scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(pauseImage, for: UIControl.State.selected)

        /*button.addTarget(self, action: #selector(self.touchUpPlayButton(_:)), for: UIControl.Event.touchUpInside)*/
        
       return button
    }()
    
    var musicView: UIView = {
        let aMusicView = UIView()
        aMusicView.backgroundColor = .darkGray
        aMusicView.layer.cornerRadius = 25
        
        aMusicView.translatesAutoresizingMaskIntoConstraints = false
        return aMusicView
    } ()
    
    let imageView: UIImageView = {
        let aImageView = UIImageView()
        
        aImageView.contentMode = .scaleAspectFit
        aImageView.image = UIImage.image
        aImageView.layer.cornerRadius = 15
        aImageView.clipsToBounds = true
        
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return aImageView
    }()
    
    
    var progressSliderView: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = UIColor(hue: 0, saturation: 0, brightness: 0.68, alpha: 1.0)
        let circle = UIImage(named: "smallThumbImage")
        slider.setThumbImage(circle, for: .normal)
       return slider
        
    } ()
    
    var progressText: UIView = {
        let totalView = UIView(frame: .zero)
        let startText = UILabel()
        let endText = UILabel()
        
        totalView.translatesAutoresizingMaskIntoConstraints = false
        startText.translatesAutoresizingMaskIntoConstraints = false
        endText.translatesAutoresizingMaskIntoConstraints = false
        
        startText.textColor = .gray
        startText.text = "1:59"
        startText.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        endText.textColor = .gray
        endText.text = "-1:54"
        endText.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        
        totalView.addSubview(startText)
        totalView.addSubview(endText)
        NSLayoutConstraint.activate([
            startText.topAnchor.constraint(equalTo: totalView.bottomAnchor),
            startText.leadingAnchor.constraint(equalTo: totalView.leadingAnchor),
            endText.topAnchor.constraint(equalTo: totalView.bottomAnchor),
            endText.trailingAnchor.constraint(equalTo: totalView.trailingAnchor)
        ])
        return totalView
    } ()
    
    var volumeSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .white
        
        return slider
    } ()

    // others
    var middleStateBar: UIView = {
        let aStateBar = UIView(frame: .zero)
        var singerName = UILabel()
        var musicName = UILabel()
        
        singerName.text = "SHAUN"
        singerName.font = UIFont.boldSystemFont(ofSize: CGFloat(20))
        singerName.textColor = .white
        musicName.text = "Way Back Home"
        musicName.font = UIFont.systemFont(ofSize: CGFloat(20))
        musicName.textColor = .white
        
        aStateBar.addSubview(singerName)
        aStateBar.addSubview(musicName)
        
        singerName.translatesAutoresizingMaskIntoConstraints = false
        musicName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            singerName.topAnchor.constraint(equalTo: aStateBar.topAnchor),
            singerName.leadingAnchor.constraint(equalTo: aStateBar.leadingAnchor),
            
            musicName.leadingAnchor.constraint(equalTo: aStateBar.leadingAnchor),
            musicName.topAnchor.constraint(equalTo: singerName.bottomAnchor)
        ])
        
        aStateBar.backgroundColor = .clear
        aStateBar.translatesAutoresizingMaskIntoConstraints = false
        
        return aStateBar
    } ()
    
    var middleIcon: UIImageView = {
        let icon = UIImage(systemName: SFSymbolKey.PlusMagnify.rawValue)
        let iconView = UIImageView(frame: .zero)
        iconView.image = icon
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        return iconView
    } ()
    
    let backWard: UIImageView = {
        let aBackWard = UIImage(systemName: SFSymbolKey.Backward.rawValue, withConfiguration: UIImage.SymbolConfiguration(
            pointSize: 25, weight: .bold, scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let aBackWardView = UIImageView(image: aBackWard)
        aBackWardView.translatesAutoresizingMaskIntoConstraints = false
        return aBackWardView
    } ()
    var foreWard: UIImageView = {
        let aForeWard = UIImage(systemName: SFSymbolKey.Forward.rawValue, withConfiguration: UIImage.SymbolConfiguration(
            pointSize: 25, weight: .bold, scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let aForeWardView = UIImageView(image: aForeWard)
        aForeWardView.translatesAutoresizingMaskIntoConstraints = false
        
        return aForeWardView
    } ()
    
    var footerImageSet: UIView = {
        let footerView = UIView(frame:  .zero)
        let quoteBubble = UIImage(systemName: SFSymbolKey.QuoteBubble.rawValue, withConfiguration: UIImage.SymbolConfiguration( pointSize: 20, weight: .regular, scale: .medium))?.withTintColor(.white,
            renderingMode: .alwaysOriginal)
        let quoteView = UIImageView(image: quoteBubble)
        
        let raidoWaves = UIImage(systemName: SFSymbolKey.RadioWaves.rawValue,
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .medium))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let radioWavesView = UIImageView(image: raidoWaves)
        
        let plusMagnify = UIImage(systemName: SFSymbolKey.PlusMagnify.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .medium))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let plusMagnifyView = UIImageView(image: plusMagnify)
        
        footerView.translatesAutoresizingMaskIntoConstraints = false
        quoteView.translatesAutoresizingMaskIntoConstraints = false
        radioWavesView.translatesAutoresizingMaskIntoConstraints = false
        plusMagnifyView.translatesAutoresizingMaskIntoConstraints = false
        
        footerView.addSubview(quoteView)
        footerView.addSubview(radioWavesView)
        footerView.addSubview(plusMagnifyView)
        
        NSLayoutConstraint.activate([
            quoteView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            radioWavesView.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            plusMagnifyView.trailingAnchor.constraint(equalTo: footerView.trailingAnchor)
        ])
    
        return footerView
    } ()
    
    // MARK: Custom Func
    func addSubViewTomusicView() {
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
    
    @objc func touchUpPlayButton(_ sender: UIButton) {
        
    }
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = .clear
        let safeAreaGuide = self.view.safeAreaLayoutGuide
        self.view.addSubview(musicView)
        self.addSubViewTomusicView()
        
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
            volumeSlider.topAnchor.constraint(equalTo: playPauseButton.bottomAnchor, constant: 20),
            volumeSlider.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 45),
            volumeSlider.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -45),
            // imgSet
            footerImageSet.leadingAnchor.constraint(equalTo:safeAreaGuide.leadingAnchor,
                                                   constant: 60),
            footerImageSet.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -60),
            footerImageSet.topAnchor.constraint(equalTo: volumeSlider.bottomAnchor, constant: 15)
        ])
        
    }

}
