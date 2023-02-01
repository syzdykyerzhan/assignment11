//
//  HeaderView.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 29.01.2023.
//

import UIKit
import SnapKit
class HeaderView: UIView {
    
    private lazy var headerLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.textColor = .black
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return myLabel
    }()
    
    private lazy var allLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.textColor = .systemOrange
        myLabel.font = UIFont.systemFont(ofSize: 15)
        return myLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setInformation(titleText: String, allText: String){
        headerLabel.text = titleText
        allLabel.text = allText
    }
    
}

//MARK: setup views and constraints

extension HeaderView{
    func setupViews(){
        addSubview(headerLabel)
        addSubview(allLabel)
    }
    func setupConstraints(){
        headerLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        allLabel.snp.makeConstraints { make in
            make.leading.equalTo(headerLabel.snp.trailing)
            make.top.trailing.bottom.equalToSuperview()
        }
    }
}
