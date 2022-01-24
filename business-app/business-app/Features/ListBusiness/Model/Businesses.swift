/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Businesses : Codable {
	let id : String?
	let alias : String?
	let name : String?
	let image_url : String?
	let is_claimed : Bool?
	let is_closed : Bool?
	let url : String?
	let phone : String?
	let display_phone : String?
	let review_count : Int?
	let categories : [Categories]?
	let rating : Double?
	let location : Location?
	let coordinates : Coordinates?
	let photos : [String]?
	let price : String?
	let hours : [Hours]?
	let transactions : [String]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case alias = "alias"
		case name = "name"
		case image_url = "image_url"
		case is_claimed = "is_claimed"
		case is_closed = "is_closed"
		case url = "url"
		case phone = "phone"
		case display_phone = "display_phone"
		case review_count = "review_count"
		case categories = "categories"
		case rating = "rating"
		case location = "location"
		case coordinates = "coordinates"
		case photos = "photos"
		case price = "price"
		case hours = "hours"
		case transactions = "transactions"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		alias = try values.decodeIfPresent(String.self, forKey: .alias)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		is_claimed = try values.decodeIfPresent(Bool.self, forKey: .is_claimed)
		is_closed = try values.decodeIfPresent(Bool.self, forKey: .is_closed)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		display_phone = try values.decodeIfPresent(String.self, forKey: .display_phone)
		review_count = try values.decodeIfPresent(Int.self, forKey: .review_count)
		categories = try values.decodeIfPresent([Categories].self, forKey: .categories)
		rating = try values.decodeIfPresent(Double.self, forKey: .rating)
		location = try values.decodeIfPresent(Location.self, forKey: .location)
		coordinates = try values.decodeIfPresent(Coordinates.self, forKey: .coordinates)
		photos = try values.decodeIfPresent([String].self, forKey: .photos)
		price = try values.decodeIfPresent(String.self, forKey: .price)
		hours = try values.decodeIfPresent([Hours].self, forKey: .hours)
		transactions = try values.decodeIfPresent([String].self, forKey: .transactions)
	}

}
