//
//  InfoCityViewController.swift
//  RxTestApp
//
//  Created by anduser on 18.04.2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class InfoCityViewController: UIViewController {
    
    var dataManager: DataManagable?
    
    lazy var tableView: UITableView = UITableView(frame: self.view.bounds, style: .grouped)
    
    let dataSource = RxTableViewSectionedReloadDataSource<CountryAndCityModel>( configureCell: {
        (_, table, indexPath, item) in
        let cell = CityTableViewCell(style: .default, reuseIdentifier: "MainCityCell")
        return cell
    })
    
    let disposeBag = DisposeBag()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let countryAndCities = getDataModel()
        let ObjectSequence = Observable<[CountryAndCityModel]>.just(countryAndCities)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = tableView.superview?.bounds ?? self.view.bounds
        //tableView.delegate = self
        //tableView.dataSource = self
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: "MainCityCell")
        self.view.addSubview(tableView)
        
        setLayout()
        
        //let dataSource = self.dataSourc
        dataSource.configureCell = { (dataSource, Table, indexPath, element) in
            let cell = CityTableViewCell(style: .default, reuseIdentifier: "MainCityCell")
            cell.cityNameLabel.text = self.getDataModel()[indexPath.section].cities[indexPath.row].name
            cell.cityPopulationLabel.text = String(self.getDataModel()[indexPath.section].cities[indexPath.row].population)
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
        
        tableView.rx.itemSelected
            .subscribe(onNext : { [unowned self] (indexPath) in
                let alert = UIAlertController(title: "City Id", message: "The city \(getDataModel()[indexPath.section].cities[indexPath.row].name) has id \(getDataModel()[indexPath.section].cities[indexPath.row].id)", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)

        //self.tableView.cellForRow(at: <#T##IndexPath#>)
        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].country
        }
        
        ObjectSequence.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)

        /*tableView.rx.modelSelected(CountryAndCityModel.self).subscribe { [unowned self] (dataModel) in
            let alert = UIAlertController(title: "City Id", message: "The city \(dataModel[tableView.rx.itemSelected]) has id \(getDataModel()[indexPath.section].cities[indexPath.row].id)", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }*/

        
//        ObjectSequence.bind(to: tableView.rx.items) { (index, model, cell)  in
//        }
//
//        ObjectSequence.bind(to: tableView.rx.items(cellIdentifier: "MainCityCell")) { index, cities, cells in
//            //tableView.setSec
//            //self.tableView.numberOfSections(in: tableView)
//        }.disposed(by: disposeBag)
        
        // Do any additional setup after loading the view.
    }
    
    func setLayout() {
        NSLayoutConstraint
            .activate([
                        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
                        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                        tableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)])
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

/*extension InfoCityViewController: UITableViewDelegate, UITableViewDataSource {
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
        //alert.addAction(<#T##action: UIAlertAction##UIAlertAction#>)
        //alert.actions.append(<#T##newElement: UIAlertAction##UIAlertAction#>)
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
    
}*/
