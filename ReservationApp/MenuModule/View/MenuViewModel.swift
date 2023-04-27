import Foundation
import UIKit

class MenuViewModel {
    
    var model: MenuItem!
    
    var sumArray = [Int]()
    var bannerModels = [BannerInfo]()
    var categoryModels = [ImageName]()
    var mainModels = [MainModel]()
    var positions = [Position]()
    var reloadData: (() -> Void)?
    var allDishesModel: [MenuItem] = [] {
        didSet {
            reloadData?()
        }
    }

    var cost: Int {
        var sum = 0
        
        for pos in positions {
            sum += pos.cost
        }
        return sum
    }
    
    func addItems() {
        DispatchQueue.main.async { [weak self] in
            self?.sumArray.append(self?.cost ?? 0)
            print("3----------------\(self?.sumArray.count)")
        }
    }
    
    func fetchCategoryItems() {
        
        let bannerModel = [BannerInfo(
            specialLabel: "Специальное предложение",
            specialDescLabel: "При заказе “Комбо меню 3”\nфирменный чай в подарок",
            kettleImage: "kettle")
        ]
        
        bannerModels.append(contentsOf: bannerModel)
        
        let categoryModel = [ImageName(imageName: "salad"),
                             ImageName(imageName: "lagman"),
                             ImageName(imageName: "hot"),
                             ImageName(imageName: "lagman"),
                             ImageName(imageName: "salad")
        ]
        
        categoryModels.append(contentsOf: categoryModel)
        
        let mainModel = [MainModel(sectionName: ["", "Category", "AllDishes"], banner: bannerModels, category: categoryModels, allDishes: allDishesModel)]
        mainModels.append(contentsOf: mainModel)
    }
    
    func getAllDishes() {
        FirestoreManager.shared.getMenuData { result in
            switch result {
            case .success(let allDishes):
                 self.allDishesModel = allDishes
               // self.allDishesModel.append(contentsOf: allDishes)
                print("ATTETION ------------- \(self.allDishesModel)")
            case .failure(let error):
                print(error.localizedDescription)
            }
            }
        }
//        FirestoreManager.shared.getAllDishes { result in
//            switch result {
//            case .success(let allDishes):
//               // self.allDishesModel = allDishes
//                self.allDishesModel.append(contentsOf: allDishes)
//                print("ATTETION ------------- \(self.allDishesModel)")
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    
    func getMenuImage() {
//        StorageManager.shared.downloadMenuImage() { result in
//            switch result {
//            case .success(let image):
//                print("\(image)")
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }

