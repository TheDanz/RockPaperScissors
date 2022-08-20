import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var rockPaperScissorsLabel: UILabel!
    @IBOutlet weak var resetTheScoreButton: UIButton!
    @IBOutlet weak var robotScoreLabel: UILabel!
    @IBOutlet weak var youScoreLabel: UILabel!
    
    var robotScore: Int = 0
    var youScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func resetTheScoreClick(_ sender: Any) {
        screenUpdate(state: .start)
    }
    
    @IBAction func rockClick(_ sender: Any) {
        signButtonClick(sign: .rock)
    }
    
    @IBAction func paperClick(_ sender: Any) {
        signButtonClick(sign: .paper)
    }
    
    @IBAction func scissorsClick(_ sender: Any) {
        signButtonClick(sign: .scissors)
    }
    
    func signButtonClick(sign: Sign) {
        let robotSign = getRandomSign()
        let gameState = GameState(firstSign: sign, secondSigh: robotSign)
        screenUpdate(state: gameState)
    }
    
    func screenUpdate(state: GameState) {
        switch state {
        case .firstWon:
            youScore += 1
            youScoreLabel.text = "You: \(youScore)"
            mainView.backgroundColor = .green
            resetTheScoreButton.isHidden = false
            rockPaperScissorsLabel.text = "You Won!"
        case .secondWon:
            robotScore += 1
            robotScoreLabel.text = "Robot: \(robotScore)"
            mainView.backgroundColor = .red
            resetTheScoreButton.isHidden = false
            rockPaperScissorsLabel.text = "You Lose!"
        case .draw:
            mainView.backgroundColor = .gray
            resetTheScoreButton.isHidden = false
            rockPaperScissorsLabel.text = "It's draw!"
        case .start:
            youScore = 0
            robotScore = 0
            youScoreLabel.text = "You: 0"
            robotScoreLabel.text = "Robot: 0"
            mainView.backgroundColor = .white
            resetTheScoreButton.isHidden = true
            rockPaperScissorsLabel.text = "Rock, Paper, Scissors?"
        }
    }
}

