/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Businesses : Codable {
	let rating : Double?
	let price : String?
    let phone : String?
    let display_phone : String?
	let id : String?
	let alias : String?
	let is_closed : Bool?
	let categories : [Categories]?
	let review_count : Int?
	let name : String?
	let url : String?
	let coordinates : Coordinates?
	let image_url : String?
	let location : Location?
	let distance : Double?
	let transactions : [String]?

	enum CodingKeys: String, CodingKey {

		case rating = "rating"
		case price = "price"
        case phone = "phone"
        case display_phone = "display_phone"
		case id = "id"
		case alias = "alias"
		case is_closed = "is_closed"
		case categories = "categories"
		case review_count = "review_count"
		case name = "name"
		case url = "url"
		case coordinates = "coordinates"
		case image_url = "image_url"
		case location = "location"
		case distance = "distance"
		case transactions = "transactions"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		rating = try values.decodeIfPresent(Double.self, forKey: .rating)
		price = try values.decodeIfPresent(String.self, forKey: .price)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        display_phone = try values.decodeIfPresent(String.self, forKey: .display_phone)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		alias = try values.decodeIfPresent(String.self, forKey: .alias)
		is_closed = try values.decodeIfPresent(Bool.self, forKey: .is_closed)
		categories = try values.decodeIfPresent([Categories].self, forKey: .categories)
		review_count = try values.decodeIfPresent(Int.self, forKey: .review_count)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		coordinates = try values.decodeIfPresent(Coordinates.self, forKey: .coordinates)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		location = try values.decodeIfPresent(Location.self, forKey: .location)
		distance = try values.decodeIfPresent(Double.self, forKey: .distance)
		transactions = try values.decodeIfPresent([String].self, forKey: .transactions)
	}

}
