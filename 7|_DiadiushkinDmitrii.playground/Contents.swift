import UIKit

enum cookingErrors: Error {
    case noDish
    case dishBurned
    case dishNotReady
}

class cookingBook {
    let dishes = [
        "Stake": 15,
        "Pasta": 30,
        "Omlet": 10,
    ]
    
    var cookingTime = 0
    
    func errors(dish: String) throws{
        
        guard let dishTime = dishes[dish] else {
            throw cookingErrors.noDish
        }
        
        if dishTime < cookingTime {
            throw cookingErrors.dishBurned
        }
        
        if dishTime > cookingTime {
            throw cookingErrors.dishNotReady
        }
        
        print("Your \(dish) is ready.")
    }
}

var cookingDish = cookingBook()

func cook(dish: String, time: Int) throws {
    let dish = dish
    cookingDish.cookingTime = time
    try cookingDish.errors(dish: dish)
}

do {
    try cook(dish: "Omlet", time: 10)
} catch cookingErrors.noDish {
    print("Dish's not found.")
} catch cookingErrors.dishBurned {
    print("You've burned your dish.")
} catch cookingErrors.dishNotReady {
    print("Your dish is not ready.")
}
