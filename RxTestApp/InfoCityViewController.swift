//
//  InfoCityViewController.swift
//  RxTestApp
//
//  Created by anduser on 18.04.2021.
//

import UIKit

class InfoCityViewController: UIViewController {
    
    var dataManager: DataManagable?
    
    lazy var tableView: UITableView = UITableView(frame: self.view.bounds, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.frame = tableView.superview?.bounds ?? self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: "MainCityCell")
        self.view.addSubview(tableView)
        
        NSLayoutConstraint
            .activate([
                        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
                        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                        tableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)])
        // Do any additional setup after loading the view.
    }
    
    func getDataModel() -> [CountryAndCityModel] {
        dataManager = JSonManager()
        return dataManager?.getDataModel() ?? [CountryAndCityModel]()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - TableViewProtocols

extension InfoCityViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return getDataModel().count
    }
    override func buildMenu(with builder: UIMenuBuilder) {
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return getDataModel()[section].country
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getDataModel()[section].cities.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "City Id", message: "The city \(getDataModel()[indexPath.section].cities[indexPath.row].name) has id \(getDataModel()[indexPath.section].cities[indexPath.row].id)", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CityTableViewCell(style: .default, reuseIdentifier: "MainCityCell")
        cell.cityNameLabel.text = getDataModel()[indexPath.section].cities[indexPath.row].name
        cell.cityPopulationLabel.text = String(getDataModel()[indexPath.section].cities[indexPath.row].population)
        cell.cityNameLabel.sizeToFit()
        cell.cityPopulationLabel.sizeToFit()
        //cell.cityNameLabel.contentScaleFactor
        //cell.intrinsicContentSiz
        if(indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.white
        }
        else {
            cell.backgroundColor = UIColor.gray
        }
        return cell
    }
    
}
