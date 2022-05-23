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
        
        let playImage = UIImage(systemName: SFSymbolKey.Play.rawValue)
        button.setImage(playImage, for: UIControl.State.normal)
        let pauseImage = UIImage(systemName: SFSymbolKey.Pause.rawValue)
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
    
    
    var progressSliderView: UIView = {
        let totalView = UIView(frame: .zero)
        let slider = UISlider()
        let startText = UILabel()
        let endText = UILabel()
        
        totalView.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        startText.translatesAutoresizingMaskIntoConstraints = false
        endText.translatesAutoresizingMaskIntoConstraints = false
        
        slider.minimumTrackTintColor = .white
        
        startText.textColor = .gray
        startText.text = "1:59"
        startText.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        endText.textColor = .gray
        endText.text = "-1:54"
        endText.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        // addTarget
        
        totalView.addSubview(slider)
        totalView.addSubview(startText)
        totalView.addSubview(endText)
        
        NSLayoutConstraint.activate([
            slider.widthAnchor.constraint(equalTo: totalView.widthAnchor),
            slider.topAnchor.constraint(equalTo: totalView.topAnchor),
            
            startText.topAnchor.constraint(equalTo: slider.bottomAnchor),
            startText.leadingAnchor.constraint(equalTo: totalView.leadingAnchor),
            endText.topAnchor.constraint(equalTo: slider.bottomAnchor),
            endText.trailingAnchor.constraint(equalTo: totalView.trailingAnchor)
            
        ])
        return totalView
    } ()
    
    /*var volumeSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        
    }*/

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
    
    /*var backWard: UIImageView = {
        
    } ()
    var foreWard: UIImageView = {
        
    } ()
    var volumeZero: UIImageView = {
        
    } ()
    var volumeFull: UIImageView = {
        
    } ()*/
    //var footerImageSet: UICollectionView
    
    
    // MARK: Custom Func
    func addSubViewTomusicView() {
        self.musicView.addSubview(middleStateBar)
        self.musicView.addSubview(imageView)
        self.musicView.addSubview(middleIcon)
        self.musicView.addSubview(progressSliderView)
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
            imageView.centerXAnchor.constraint(equalTo: musicView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: musicView.centerYAnchor, constant: -140.0),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            musicView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            musicView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            musicView.widthAnchor.constraint(equalTo: view.widthAnchor),
            musicView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            middleStateBar.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
            middleStateBar.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            middleStateBar.leadingAnchor.constraint(equalTo: musicView.leadingAnchor, constant: 30),
            middleStateBar.heightAnchor.constraint(equalToConstant: 25),
            
            middleIcon.trailingAnchor.constraint(equalTo: musicView.trailingAnchor, constant: -30),
            middleIcon.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
            middleIcon.widthAnchor.constraint(equalToConstant: 20),
            middleIcon.heightAnchor.constraint(equalToConstant: 20),
            
            progressSliderView.topAnchor.constraint(equalTo: middleStateBar.bottomAnchor, constant: 30),
            progressSliderView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16 ),
            progressSliderView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            
        ])
        
    }

}

