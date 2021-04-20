//
//  CityTableViewCell.swift
//  RxTestApp
//
//  Created by anduser on 18.04.2021.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    lazy var cityNameLabel: UILabel = UILabel()
    lazy var cityPopulationLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityPopulationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(cityNameLabel)
        self.contentView.addSubview(cityPopulationLabel)

        cityNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        cityNameLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 5).isActive = true
        cityNameLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cityPopulationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
        cityPopulationLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        cityPopulationLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true

        cityNameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        cityPopulationLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
