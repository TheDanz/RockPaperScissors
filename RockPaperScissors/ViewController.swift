import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var robotLabel: UILabel!
    @IBOutlet weak var rockPaperScissorsLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playAgainClick(_ sender: Any) {
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
            mainView.backgroundColor = .green
            playAgainButton.isHidden = false
            rockPaperScissorsLabel.text = "You Won!"
        case .secondWon:
            mainView.backgroundColor = .red
            playAgainButton.isHidden = false
            rockPaperScissorsLabel.text = "You Lose!"
        case .draw:
            mainView.backgroundColor = .gray
            playAgainButton.isHidden = false
            rockPaperScissorsLabel.text = "It's draw!"
        case .start:
            mainView.backgroundColor = .white
            playAgainButton.isHidden = true
            rockPaperScissorsLabel.text = "Rock, Paper, Scissors?"
        }
    }
}

