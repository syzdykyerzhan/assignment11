//
//  CinemaTableViewCell.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 26.01.2023.
//

import UIKit
import SnapKit

class CinemaTableViewCell: UITableViewCell {

    private lazy var cinemaImage : UIImageView = {
        let myImage = UIImageView(image: UIImage(named: "puss_in_boots"))
        myImage.layer.cornerRadius = 5
        myImage.clipsToBounds = true
        return myImage
    }()
    
    private lazy var myView : UIView = {
        let myView = UIView()
        return myView
    }()
    
    private lazy var titleLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.font = UIFont.boldSystemFont(ofSize: 17)
        //myLabel.backgroundColor = .yellow
        return myLabel
    }()
    
    private lazy var informLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.font = UIFont.systemFont(ofSize: 13)
        myLabel.textColor = .systemGray
        myLabel.numberOfLines = 0
        return myLabel
    }()
    
    public func setInformation(image: String, title: String, inform: String){
        cinemaImage.image = UIImage(named: image)
        titleLabel.text = title
        informLabel.text = inform
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: setup views and constraints

extension CinemaTableViewCell{
    func setupViews(){
        contentView.addSubview(cinemaImage)
        contentView.addSubview(myView)
        myView.addSubview(titleLabel)
        myView.addSubview(informLabel)
    }
    func setupConstraints(){
        cinemaImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
        }
        myView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(cinemaImage.snp.trailing).offset(15)
            make.trailing.bottom.equalToSuperview().inset(5)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        informLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            
        }
        
    }
}
