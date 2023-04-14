import Foundation

class MenuViewModel {
    
    var model = [Category]()
    
    func fetchCategoryItems(completion: @escaping () -> Void) {
        FirestoreManager.shared.fetchCategories { result in
            switch result {
            case .success(let result):
                self.model.append(contentsOf: result)
                print("\(self.model)")
            case .failure(let error):
                print("Error.", error.localizedDescription)
            }
            completion()
        }
    }
}
