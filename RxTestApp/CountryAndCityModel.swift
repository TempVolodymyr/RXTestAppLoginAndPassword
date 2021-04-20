//
//  CityModel.swift
//  RxTestApp
//
//  Created by anduser on 19.04.2021.
//

import Foundation
import RxDataSources

struct CountryAndCityModel: Decodable {
    let country: String
    let cities: [City]
    
    internal struct City: Decodable, Hashable, IdentifiableType {
        var identity: City { return self }
        
       typealias Identity = City
       
       let name: String
       let id: String
       let population: Int
   }
}

extension CountryAndCityModel: SectionModelType {
    init(original: CountryAndCityModel, items: [City]) {
        self = original
        //self.cities = items
    }
    
    var identity: String { return country}
    
    var items: [City] { return cities }
    
    typealias Item = City
    
    typealias Identity = String
}
