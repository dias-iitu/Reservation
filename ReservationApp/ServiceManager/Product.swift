import Foundation

struct Position: Codable {
    let id: String
    let menuItem: MenuItem
    var count: Int
    
    var cost: Int {
        return menuItem.dishPrice * count
    }
}
