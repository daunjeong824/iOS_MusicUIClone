//
//  ViewController+View.swift
//  ViewImages
//
//  Created by 정다운 on 2022/05/23.
//

import UIKit

class ViewSet: UIViewController {
    
    // MARK: Element
    var playPauseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let playImage = UIImage(systemName: SFSymbolKey.Play.rawValue,
            withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: 40, weight: .bold, scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(playImage, for: UIControl.State.normal)
        
        let pauseImage = UIImage(systemName: SFSymbolKey.Pause.rawValue, withConfiguration: UIImage.SymbolConfiguration(
            pointSize: 45, weight: .bold, scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(pauseImage, for: UIControl.State.selected)
        
       return button
    }()
    
    var musicView: UIView = {
        let aMusicView = UIView()
        aMusicView.backgroundColor = .clear
        
        aMusicView.translatesAutoresizingMaskIntoConstraints = false
        return aMusicView
    } ()
    
    let imageView: UIImageView = {
        let aImageView = UIImageView()
        
        aImageView.contentMode = .scaleAspectFit
        aImageView.image = UIImage.image
        aImageView.layer.cornerRadius = 10
        aImageView.clipsToBounds = true
        
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return aImageView
    }()
    
    var progressSliderView: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = UIColor(hue: 0, saturation: 0, brightness: 0.76, alpha: 0.7)
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
        
        startText.textColor = .white
        startText.text = "1:59"
        startText.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        endText.textColor = .white
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
        let config = UIImage.SymbolConfiguration(scale: .small)
        let noSound = UIImage(systemName: "speaker.fill", withConfiguration: config)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let fullSound = UIImage(systemName: "speaker.wave.3", withConfiguration: config)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = UIColor(hue: 0, saturation: 0, brightness: 0.76, alpha: 0.7)
        slider.minimumValueImage = noSound
        slider.maximumValueImage = fullSound

        return slider
    } ()


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
        let icon = UIImage(systemName: SFSymbolKey.PlusMagnify.rawValue, withConfiguration: UIImage.SymbolConfiguration(
            pointSize: 25, weight: .regular, scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let iconView = UIImageView()
        iconView.image = icon?.withAlignmentRectInsets(UIEdgeInsets(top: -2, left: -2, bottom: -2, right: -2))
        
        iconView.backgroundColor = .lightGray
        iconView.alpha = 0.7
        iconView.layer.cornerRadius = 10
        iconView.contentMode = .scaleAspectFill
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
        let quoteBubble = UIImage(systemName: SFSymbolKey.QuoteBubble.rawValue, withConfiguration: UIImage.SymbolConfiguration( pointSize: 20, weight: .regular, scale: .medium))?.withTintColor(.black,
            renderingMode: .alwaysOriginal)
        let quoteView = UIImageView()
        quoteView.image = quoteBubble?.withAlignmentRectInsets(UIEdgeInsets(top: -2, left: -2, bottom: -2, right: -2)) // 왜 안됨?
        quoteView.layer.cornerRadius = 6.0
        quoteView.alpha = 0.7
        quoteView.backgroundColor = .white
        quoteView.contentMode = .scaleAspectFill
        
        let raidoWaves = UIImage(systemName: SFSymbolKey.RadioWaves.rawValue,
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .medium))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let radioWavesView = UIImageView(image: raidoWaves)
        radioWavesView.alpha = 0.7
        
        let listBullet = UIImage(systemName: SFSymbolKey.ListBullet.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .medium))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let listBulletView = UIImageView(image: listBullet)
        listBulletView.alpha = 0.7
        
        footerView.translatesAutoresizingMaskIntoConstraints = false
        quoteView.translatesAutoresizingMaskIntoConstraints = false
        radioWavesView.translatesAutoresizingMaskIntoConstraints = false
        listBulletView.translatesAutoresizingMaskIntoConstraints = false
        
        footerView.addSubview(quoteView)
        footerView.addSubview(radioWavesView)
        footerView.addSubview(listBulletView)
        
        NSLayoutConstraint.activate([
            quoteView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            radioWavesView.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            listBulletView.trailingAnchor.constraint(equalTo: footerView.trailingAnchor)
        ])
    
        return footerView
    } ()
}
