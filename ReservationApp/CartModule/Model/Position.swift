import Foundation

struct Position {
    let id: String
    let menuItem: MenuItem
    var count: Int
    
    var cost: Int {
        menuItem.dishPrice * count
    }
}
