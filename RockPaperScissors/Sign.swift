import GameplayKit

enum Sign {
    case rock, paper, scissors
}

func getRandomSign() -> Sign {
    let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
    let sign = randomChoice.nextInt()
    
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}
