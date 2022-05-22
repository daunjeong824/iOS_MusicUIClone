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
    var playPauseButton: UIButton!
    
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
    
    var progressSlider: UISlider!
    
    // others
    var middleStateBar: UIView = {
        let aStateBar = UIView(frame: .zero)
        var singerName = UILabel()
        var musicName = UILabel()
        
        singerName.text = "SHAUN"
        singerName.font = UIFont.boldSystemFont(ofSize: CGFloat(20))
        singerName.textColor = .white
        musicName.text = "Way Back Home"
        musicName.font = UIFont.systemFont(ofSize: UIFont.labelFontSize)
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
    
    // MARK: Custom Func
    func addSubViewTomusicView() {
        self.musicView.addSubview(middleStateBar)
        self.musicView.addSubview(imageView)
        self.musicView.addSubview(middleIcon)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = .clear
        self.view.addSubview(musicView)
        self.addSubViewTomusicView()
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: musicView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: musicView.centerYAnchor, constant: -100.0),
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
            middleIcon.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
    }

}

