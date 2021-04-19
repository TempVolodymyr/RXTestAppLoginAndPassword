//
//  CityModel.swift
//  RxTestApp
//
//  Created by anduser on 19.04.2021.
//

import Foundation


struct CountryAndCityModel: Decodable {
    let country: String
    let cities: [City]
    
    internal struct City: Decodable {
        let name: String
        let id: String
        let population: Int
    }
}
