//
//  MainVC_2.swift
//  RandomImage
//
//  Created by MuhammadAli on 04/01/24.
//

import UIKit

let windowWidth: CGFloat = UIScreen.main.bounds.width
let windowHeight: CGFloat = UIScreen.main.bounds.height

class MainVC_2: UIViewController {
    
    var topLabel = UILabel()
    
    var buttomLbl = UILabel()
    
    var imgArray = [UIImageView]()
    
    var ball = 500
    
    var bonus = 0
    
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

    }
    
    func setupUI() {
        
        let spacingLeftRight: CGFloat = 20
        let spacing: CGFloat = 10
        let imgWidth: CGFloat = (windowWidth - (spacingLeftRight * 2) - (spacing * 2)) / 3
        
        topLabel.frame = CGRect(
            x: spacingLeftRight,
            y: 100,
            width: windowWidth - (spacingLeftRight * 2),
            height: 70)
        topLabel.textAlignment = .center
        topLabel.textColor = .white
        topLabel.text = "Bonus: 0"
        topLabel.font = .boldSystemFont(ofSize: 32)
        topLabel.layer.cornerRadius = 12
        topLabel.layer.borderColor = UIColor.pushti.cgColor
        topLabel.layer.borderWidth = 3
        topLabel.layer.shadowColor = UIColor.black.cgColor
        topLabel.layer.shadowOpacity = 0.50
        self.view.addSubview(topLabel)
        
        for i in 0 ... 2 {
            let img = UIImageView(
                frame: CGRect(
                    x: spacingLeftRight + CGFloat(i) * (spacing + imgWidth),
                    y: topLabel.frame.maxY + 80,
                    width: imgWidth,
                    height: imgWidth))
            img.layer.cornerRadius = 12
            img.layer.borderColor = UIColor.pushti.cgColor
            img.tintColor = .white
            img.contentMode = .scaleAspectFit
            img.image = UIImage(systemName: "camera.metering.unknown")
            img.layer.borderWidth = 3
            img.layer.shadowColor = UIColor.black.cgColor
            img.layer.shadowOpacity = 0.50
            self.view.addSubview(img)
            self.imgArray.append(img)

        }
        
        let startBtn = UIButton(
            frame: CGRect(
                x: spacingLeftRight,
                y: self.topLabel.frame.maxY + 300,
                width: windowWidth - (spacingLeftRight * 2),
                height: 70))
        startBtn.setTitle("Start", for: .normal)
        startBtn.setTitleColor(.white, for: .normal)
        startBtn.titleLabel?.font = .boldSystemFont(ofSize: 32)
        startBtn.layer.cornerRadius = 12
        startBtn.layer.borderColor = UIColor.pushti.cgColor
        startBtn.layer.borderWidth = 3
        startBtn.addTarget(self, action: #selector(onButton), for: .touchUpInside)
        startBtn.layer.shadowColor = UIColor.black.cgColor
        startBtn.layer.shadowOpacity = 0.50
        self.view.addSubview(startBtn)
        
        buttomLbl.frame = CGRect(
            x: spacingLeftRight,
            y: startBtn.frame.maxY + 150,
            width: windowWidth - (spacingLeftRight * 2),
            height: 70)
        buttomLbl.textAlignment = .center
        buttomLbl.text = "Umumiy ball: 500"
        buttomLbl.layer.cornerRadius = 12
        buttomLbl.font = .boldSystemFont(ofSize: 32)
        buttomLbl.textColor = .white
        buttomLbl.layer.borderColor = UIColor.pushti.cgColor
        buttomLbl.layer.borderWidth = 3
        buttomLbl.layer.shadowColor = UIColor.black.cgColor
        buttomLbl.layer.shadowOpacity = 0.50
        self.view.addSubview(buttomLbl)
        
    }
    
    @objc func onButton() {
        if ball > 0 {
            imgArray[0].image = imgs.randomElement()
            imgArray[1].image = imgs.randomElement()
            imgArray[2].image = imgs.randomElement()
            checkImg()
        }
    }
    
    
    
    func checkImg() {
        if imgArray[0].image == imgArray[1].image && 
            imgArray[1].image == imgArray[2].image {
            bonus += 100
            ball += 100
            topLabel.text = "Bonus: \(bonus)"
            buttomLbl.text = "Umumiy ball: \(ball)"
        } else {
            if ball > 0 {
                ball -= 10
                buttomLbl.text = "Umumiy ball: \(ball)"
            }
            
            if ball == 0 {
                self.gameOver()
            }
        }
    }
    
    func gameOver() {
        let over = UIImageView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight))
        over.image = UIImage(systemName: "figure.fall")
        over.contentMode = .scaleAspectFit
        over.backgroundColor = .jigar
        self.view.addSubview(over)
    }
    
    

}
