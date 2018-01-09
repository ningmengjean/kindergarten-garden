//Solution goes in Sources
import Foundation

enum Plant: Character {
    case grass = "G"
    case clover = "C"
    case radishes = "R"
    case violets = "V"
    case error = "E"
}

struct Garden {
    let sortedChildren: [String]
    var plantsByChild = [String: [Plant]]()
   
    init(_ diagram: String, children:[String] = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]) {
        sortedChildren = children.sorted()
        let rows = diagram.split(separator: "\n")
        for row in rows {
            addPlants(row.map{ Plant(rawValue: $0) ?? .error})
        }
    }
    private mutating func addPlants(_ plant: [Plant]) {
        guard plant.count <= 2 * sortedChildren.count else {
            return
        }
        for (plantIndex, plant) in plant.enumerated() {
            let childIndex = plantIndex / 2
            let child = sortedChildren[childIndex]
            if plantsByChild[child] != nil {
                plantsByChild[child]!.append(plant)
            } else {
                plantsByChild[child] = [plant]
            }
        }
        
    }
    
    func plantsForChild(_ childName: String) -> [Plant] {
        return plantsByChild[childName] ?? []
    }
}
