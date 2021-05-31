//
//  JSoNManager.swift
//  RxTestApp
//
//  Created by anduser on 19.04.2021.
//
import Foundation

protocol DataManagable {
    func getDataModel() -> [CountryAndCityModel]
}

struct JSonManager: DataManagable {
    func getDataModel() -> [CountryAndCityModel] {
        let CitiesModel = [CountryAndCityModel.City(name: "Kyiv", id: "4", population: 150), CountryAndCityModel.City(name: "Odessa", id: "5", population: 178)]
        
        var ObjectModel = [CountryAndCityModel]()
        ObjectModel.append(CountryAndCityModel(country: "Belarus", cities: [CountryAndCityModel.City(name: "Minsk", id: "1", population: 100), CountryAndCityModel.City(name: "Brest", id: "2", population: 200), CountryAndCityModel.City(name: "Vitebsk", id: "3", population: 50)]))
        ObjectModel.append(CountryAndCityModel(country: "Ukraine", cities: CitiesModel))
        
        return ObjectModel
    }
}
