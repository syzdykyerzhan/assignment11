//
//  MovieViewController.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 25.01.2023.
//

import UIKit
import SnapKit

final class MovieViewController: UIViewController {
    
    var myAPI = APICaller()
    var movieList : [MovieModel] = []
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var searchBar : UISearchBar = {
        let mysearchBar = UISearchBar()
        mysearchBar.layer.cornerRadius = 10
        mysearchBar.searchBarStyle = .minimal
        mysearchBar.placeholder = "Search movies,series and tv shows"
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
    
    private lazy var movieCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.movieCollectionViewCell)
        myCollectionView.showsHorizontalScrollIndicator = false
        return myCollectionView
    }()
    
    private lazy var categoriesTableView : UITableView = {
        let myTableView = UITableView()
        myTableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.categoriesTableViewCell)
        myTableView.allowsSelection = false
        myTableView.isScrollEnabled = false
        myTableView.separatorStyle = .none
        return myTableView
    }()
    
    private var selectedItemAt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        categoriCollectionView.dataSource = self
        categoriCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
        myAPI.delegate = self
        
        myAPI.fetchRequest()
        
        setupViews()
        setupConstraints()
        
        //print(movieList)
    }

}

//MARK: APICaller delegate

extension MovieViewController: APICallerDelegate{
    func didUpdateMovieList(with movieList: [MovieModel]) {
        self.movieList = movieList
    }
    
    func didFailWithError(_ error: Error) {
        print("Found error \(error)")
    }
    
    
}

//MARK: Table View Data Source

extension MovieViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.categoriesTableViewCell, for: indexPath) as! CategoriesTableViewCell
        cell.setMovies(listOfMovie: movieList)
        //cell.backgroundColor = .systemBlue
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        listOfCategories.count - 1
    }
}

//MARK: Table View Delegate
extension MovieViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(tableView.frame.height / 4)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView()
        
        headerView.setInformation(titleText: String(listOfCategories[section+1].rawValue.dropFirst()), allText: "Все 6")
        return headerView
    }
}

//MARK: Collection View DataSource
extension MovieViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriCollectionView{
            return listOfCategories.count
        }
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriCollectionView{
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.movieCollectionViewCell, for: indexPath) as! MovieCollectionViewCell
        cell.setInformation(backdrop_path: movieList[indexPath.item].backdropPath)
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        
        return cell
    }
}

//MARK: Collection view Delegate

extension MovieViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == categoriCollectionView{
            let label = UILabel()
            label.text = listOfCategories[indexPath.row].rawValue
            label.font = UIFont.systemFont(ofSize: 20)
            label.sizeToFit()
            return CGSize(width: label.frame.size.width + 20, height: collectionView.frame.size.height - 15)
        }
        return CGSize(width: collectionView.frame.size.width - 30, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItemAt = indexPath.row
        collectionView.reloadData()
    }
}

//MARK: setup views and constraints

extension MovieViewController{
    func setupViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(searchBar)
        contentView.addSubview(categoriCollectionView)
        contentView.addSubview(movieCollectionView)
        contentView.addSubview(categoriesTableView)
    }
    func setupConstraints(){
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(15)
            
        }
        searchBar.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.05)
        }
        categoriCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.07)
        }
        movieCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoriCollectionView.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.2)
        }
        categoriesTableView.snp.makeConstraints { make in
            make.top.equalTo(movieCollectionView.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(view).multipliedBy(1.2)
        }
    }
}
