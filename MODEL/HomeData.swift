//
//  HomeData.swift
//  MTGET
//
//  Created by Jenith on 21/06/23.
//

import Foundation
struct HomeData : Codable {
    let type : String?
    let values : [Values]?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case values = "values"
    }

    init(from decoder: Decoder) throws {
        let values1 = try decoder.container(keyedBy: CodingKeys.self)
        type = try values1.decodeIfPresent(String.self, forKey: .type)
        values = try values1.decodeIfPresent([Values].self, forKey: .values)
    }

}
