//
//  ViewController.swift
//  UIViewPratice
//
//  Created by 이명진 on 2023/04/27.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel! // 속성의 타입은 UILabel
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureUI() // 일반적으로 이렇게 사용
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택 하시오."
        
        // slider.setValue(1, animated: true)
        // animated는 자연스럽게 이동하냐 아니냐
        slider.value = 0.5
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        let seconds = Int(slider.value * 60)
        mainLabel.text = "\(seconds) 초"
        number = seconds
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            if number > 0 {
                number -= 1
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
                
                
                
            } else {
                number = 0
                mainLabel.text = "초를 선택 하시오."
                
                timer?.invalidate()
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
            
        }
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택 하시오."
        slider.value = 0.5
    }
    
}

