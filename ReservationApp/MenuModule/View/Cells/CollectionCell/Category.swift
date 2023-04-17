import Foundation

struct MainModel: Codable {
    let sectionName: [String]
    let banner: [BannerInfo]
    let category: [ImageName]
    let allDishes: [MenuItem]
}

struct BannerInfo: Codable {
    let specialLabel: String
    let specialDescLabel: String
    let kettleImage: String
}

struct ImageName: Codable {
    let imageName: String
}
