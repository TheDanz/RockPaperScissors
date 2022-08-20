enum GameState {
    case firstWon, secondWon, draw
    
    init(firstSign: Sign, secondSigh: Sign) {
        switch firstSign {
        case .rock:
            switch secondSigh {
            case .rock:
                self = .draw
            case .paper:
                self = .secondWon
            case .scissors:
                self = .firstWon
            }
        case .paper:
            switch secondSigh {
            case .rock:
                self = .firstWon
            case .paper:
                self = .draw
            case .scissors:
                self = .secondWon
            }
        case .scissors:
            switch secondSigh {
            case .rock:
                self = .secondWon
            case .paper:
                self = .firstWon
            case .scissors:
                self = .draw
            }
        }
    }
}
