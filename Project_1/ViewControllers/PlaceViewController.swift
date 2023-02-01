//
//  TheatreViewController.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 25.01.2023.
//

import UIKit

final class PlaceViewController: UIViewController {

    var myAPI = APICaller()
    var movieList : [MovieModel] = []
    
    private lazy var searchBar : UISearchBar = {
        let mysearchBar = UISearchBar()
        mysearchBar.layer.cornerRadius = 10
        mysearchBar.searchBarStyle = .minimal
        mysearchBar.placeholder = "Search places"
        return mysearchBar
    }()
    
    private lazy var categoriCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell)
        myCollectionView.showsHorizontalScrollIndicator = false
        return myCollectionView
    }()
    
    private let listOfCategories = Categories.allCases
    
    private lazy var cinemaTableView : UITableView = {
        let myTableView = UITableView()
        myTableView.register(CinemaTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.cinemaTableViewCell)
        return myTableView
    }()
    
    
    let listOfCinema = CinemaClass().getListOfCinemas()
    
    var selectedItemAt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        categoriCollectionView.dataSource = self
        categoriCollectionView.delegate = self
        cinemaTableView.dataSource = self
        cinemaTableView.delegate = self
        myAPI.delegate = self
        
        myAPI.fetchRequest()
        
        setupViews()
        setupConstraints()
    }
}

//MARK: APICaller Delegate

extension PlaceViewController : APICallerDelegate{
    func didUpdateMovieList(with movieList: [MovieModel]) {
        self.movieList = movieList
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
    
}

//MARK: Table View Datasource

extension PlaceViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.cinemaTableViewCell, for: indexPath) as! CinemaTableViewCell
        let movie = movieList[indexPath.row]
        cell.setInformation(backdrop_path: movie.backdropPath, title: movie.originalTitle, inform: movie.overview)
        return cell
    }
}

//MARK: Table View Delegate

extension PlaceViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(view.frame.size.height * 0.11)
    }
}

//MARK: Collection View DataSource
extension PlaceViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
            
        cell.setInformation(with: listOfCategories[indexPath.row].rawValue)
        if(selectedItemAt == indexPath.row){
            cell.backgroundColor = .systemOrange
        }else{
            cell.backgroundColor = .systemGray6
        }
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        
        return cell
    }
}

//MARK: Collection view Delegate

extension PlaceViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = listOfCategories[indexPath.row].rawValue
        label.font = UIFont.systemFont(ofSize: 20)
        label.sizeToFit()
        return CGSize(width: label.frame.size.width + 20, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItemAt = indexPath.row
        collectionView.reloadData()
    }
}

//MARK: setup views and constraints

extension PlaceViewController{
    func setupViews(){
        view.addSubview(searchBar)
        view.addSubview(categoriCollectionView)
        view.addSubview(cinemaTableView)
    }
    func setupConstraints(){
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        categoriCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        cinemaTableView.snp.makeConstraints { make in
            make.top.equalTo(categoriCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
        }
    }
}
