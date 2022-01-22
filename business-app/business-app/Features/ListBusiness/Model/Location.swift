/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Location : Codable {
	let city : String?
	let country : String?
	let address2 : String?
	let address3 : String?
	let state : String?
	let address1 : String?
	let zip_code : String?

	enum CodingKeys: String, CodingKey {

		case city = "city"
		case country = "country"
		case address2 = "address2"
		case address3 = "address3"
		case state = "state"
		case address1 = "address1"
		case zip_code = "zip_code"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		address2 = try values.decodeIfPresent(String.self, forKey: .address2)
		address3 = try values.decodeIfPresent(String.self, forKey: .address3)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		address1 = try values.decodeIfPresent(String.self, forKey: .address1)
		zip_code = try values.decodeIfPresent(String.self, forKey: .zip_code)
	}

}