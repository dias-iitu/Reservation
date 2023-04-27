import Foundation

class CartViewModel {
  
    var positions = [Position]()
    
    func addPosition(_ position: Position) {
        positions.append(position)
    }
}
