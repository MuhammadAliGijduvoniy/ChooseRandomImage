//
//  ViewController.swift
//  RandomImage
//
//  Created by MuhammadAli on 01/12/23.
//


import AVFoundation
import UIKit



class MainVC: UIViewController {
    
    var player: AVAudioPlayer!
    
    var img1 = UIImageView()
    var img2 = UIImageView()
    var img3 = UIImageView()

    var toplabel = UILabel()
    var buttomLabel = UILabel()
    
    var bonus = 0
    var achko = 500
    
    var imgs: [UIImage] = [
        UIImage(named: "chameleon")!,
        UIImage(named: "panda")!,
        UIImage(named: "shark")!,
        UIImage(named: "snail")!,
        UIImage(named: "smile")!
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .jigar
        setupUI()
        audio()
        
    }
    func setupUI() {
        
        let widths = Int(UIScreen.main.bounds.width - 40)
        let heights = 50
        
        
        toplabel.frame = CGRect(
            x: 20,
            y: 100,
            width: widths,
            height: heights)
        toplabel.font = .boldSystemFont(ofSize: 24)
        toplabel.text = "Qoshimcha bal: 0"
        toplabel.textColor = .white
        toplabel.textAlignment = .center
        toplabel.layer.cornerRadius = 12
        toplabel.layer.borderWidth = 2
        toplabel.layer.borderColor = UIColor.pushti.cgColor
        self.view.addSubview(toplabel)
        
        let imgSize = (UIScreen.main.bounds.width - 80) / 3
        let spacing: CGFloat = 20
        img1.frame = CGRect(
            x: 20,
            y: toplabel.frame.maxY + 50,
            width: imgSize,
            height: imgSize)
        img1.contentMode = .scaleAspectFit
        img1.layer.cornerRadius = 12
        img1.layer.borderColor = UIColor.pushti.cgColor
        img1.layer.borderWidth = 4
        img1.tintColor = UIColor.white
        img1.image = UIImage(systemName: "camera.metering.unknown")
        self.view.addSubview(img1)
        
        img2.frame = CGRect(
            x: spacing * 2  + imgSize,
            y: toplabel.frame.maxY + 50,
            width: imgSize,
            height: imgSize)
        img2.contentMode = .scaleAspectFit
        img2.layer.cornerRadius = 12
        img2.layer.borderColor = UIColor.pushti.cgColor
        img2.layer.borderWidth = 4
        img2.tintColor = UIColor.white
        img2.image = UIImage(systemName: "camera.metering.unknown")
        self.view.addSubview(img2)
        
        img3.frame = CGRect(
            x: spacing * 3  + 2 * imgSize,
            y: toplabel.frame.maxY + 50,
            width: imgSize,
            height: imgSize)
        img3.contentMode = .scaleAspectFit
        img3.layer.cornerRadius = 12
        img3.layer.borderColor = UIColor.pushti.cgColor
        img3.layer.borderWidth = 4
        img3.tintColor = UIColor.white
        img3.image = UIImage(systemName: "camera.metering.unknown")
        self.view.addSubview(img3)
        
        
        let startBtn = UIButton()
        startBtn.frame = CGRect(
            x: 20,
            y: Int(img2.frame.maxY) + 100,
            width: widths,
            height: heights)
        startBtn.setTitle("Start", for: .normal)
        startBtn.titleLabel?.font = .boldSystemFont(ofSize: 30)
        startBtn.setTitleColor(.white, for: .normal)
        startBtn.layer.cornerRadius = 12
        startBtn.layer.borderColor = UIColor.pushti.cgColor
        startBtn.layer.borderWidth = 2
        startBtn.addTarget(self, action: #selector(onStartBtn), for: .touchUpInside)
        self.view.addSubview(startBtn)
        
        buttomLabel.frame = CGRect(
            x: 20,
            y: Int(startBtn.frame.maxY) + 270,
            width: widths,
            height: heights)
        buttomLabel.text = "Imkoniyatlar bali: 500"
        buttomLabel.textAlignment = .center
        buttomLabel.font = .boldSystemFont(ofSize: 24)
        buttomLabel.textColor = .white
        buttomLabel.layer.cornerRadius = 12
        buttomLabel.layer.borderWidth = 2
        buttomLabel.layer.borderColor = UIColor.pushti.cgColor
        self.view.addSubview(buttomLabel)
    }
    
    @objc func onStartBtn() {
        if achko > 0 {
            img1.image = imgs.randomElement()
            img2.image = imgs.randomElement()
            img3.image = imgs.randomElement()
            chackImage()
        } 
    }
    
    func audio() {
        let path = Bundle.main.path(forResource: "success", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func chackImage() {
        if img1.image == img2.image && img2.image == img3.image {
            player.play()
            bonus += 100
            achko += 100
            self.toplabel.text = "Qo'shimcha bal: \(bonus)"
            self.buttomLabel.text = "Imkoniyatlar bali: \(achko)"
        } else {
            if achko > 0 {
                achko -= 10
                self.buttomLabel.text = "Imkoniyatlar bali: \(achko)"
            }
            
            if achko == 0 {
                gameOver()
//                buttomLabel.frame = CGRect(x: 50, y: UIScreen.main.bounds.maxY - 50 , width: UIScreen.main.bounds.width - 100, height: 50)
            }
        }
    }
    
    func gameOver() {
        let overImage = UIImageView()
        overImage.frame = CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height )
            
        overImage.image = UIImage(systemName: "figure.fall")
        

        overImage.backgroundColor = .white
        overImage.contentMode = .scaleAspectFit
            view.addSubview(overImage)
    }
}
