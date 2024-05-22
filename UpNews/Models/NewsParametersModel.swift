import UIKit

struct NewsParametersModel: Codable {
    let page: Int
    let pageSize: Int
    let category: String?
    let q: String?
    
    enum CodingKeys: String, CodingKey {
        case page
        case pageSize
        case category
        case q
    }
    
    // すべてのプロパティを初期化するイニシャライザ
    init(page: Int, pageSize: Int, category: String? = nil,q: String? = nil) {
        self.page = page
        self.pageSize = pageSize
        self.category = category
        self.q = q
    }
}
