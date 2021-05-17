//
//  ViewController.swift
//  Ｑ＆Ａ
//
//  Created by Monica Lo on 2021/5/9.
//

import UIKit

class ViewController: UIViewController {
 
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var junAnswer: UIImageView!
    @IBOutlet weak var junAsk: UIImageView!
    @IBOutlet weak var memberAnswer: UIImageView!
    @IBOutlet weak var memberAsk: UIImageView!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    var questions = [Question]()
    var Index = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playAgainButton.layer.cornerRadius = 15
        playAgainButton.clipsToBounds = true
        
        numberLabel.layer.cornerRadius = 13
        numberLabel.clipsToBounds = true
      
        let question1 = Question(description: "我生日是何時?", answer: "8 / 30(粉絲必備常識)")
        questions.append(question1)
        let question2 = Question(description: "我認為自己何處最有魅力?", answer: "眉毛(從小就霸氣十足!)")
        questions.append(question2)
        let question3 = Question(description: "我最喜歡的英文字母?", answer: " “ J ” - Jun, Janizu, Japan")
        questions.append(question3)
        let question4 = Question(description: "我的理想房型?", answer: "完全無隔間一房(廁所怎辦😝)")
        questions.append(question4)
        let question5 = Question(description: "我隨身必備物品為何?", answer: "只能是水了!(而且絕對要常溫)")
        questions.append(question5)
        let question6 = Question(description: "我最喜歡的漫畫?", answer: "ONE PIECE(都合作了😙)")
        questions.append(question6)
        let question7 = Question(description: "我進入休息室說的第一句話?", answer: "早~(來看衣服吧才是正解😆)")
        questions.append(question7)
        let question8 = Question(description: "我想要的代表色其實是?", answer: "紅色(翔表示訝異😳)")
        questions.append(question8)
        let question9 = Question(description: "去KTV被要求唱傑尼斯歌時會唱?", answer: "愛死後輩的 Cinderella Girl 😂")
        questions.append(question9)
        let question10 = Question(description: "我的夢想?", answer: "稱霸全世界!(超潤🤣)")
        questions.append(question10)
        
        questions.shuffle()
        questionLabel.text = questions[Index].description
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        Index += 1
        if Index <= 9{
          questionLabel.text = questions[Index].description
          answerLabel.text = ""
            
          progressView.progress = Float(Index + 1) / 10
          numberLabel.text = String(Index + 1) + "/10"
            
          junAsk.isHidden = false
          memberAsk.isHidden = false
          junAnswer.isHidden = true
          memberAnswer.isHidden = true
        } else {
               let controller = UIAlertController(title: "還想繼續研(惡)究(整)我 ?", message: "再按Repeat鍵吧 🤦🏻‍♂️", preferredStyle: .alert)
               let okAction = UIAlertAction(title: "好的~", style: .default, handler: nil)
               controller.addAction(okAction)
               present(controller, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func showAnswer(_ sender: UIButton) {
        answerLabel.text = questions[Index].answer
        
        junAnswer.isHidden = false
        memberAnswer.isHidden = false
        junAsk.isHidden = true
        memberAsk.isHidden = true
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        questions.shuffle()
        Index = 0
        
        questionLabel.text = questions[Index].description
        answerLabel.text = ""
        progressView.progress = 0.1
        numberLabel.text = "1/10"
        
        junAsk.isHidden = false
        memberAsk.isHidden = false
        junAnswer.isHidden = true
        memberAnswer.isHidden = true
        
    }
    
    
}
