//
//  Constants.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 25.01.2023.
//

import Foundation

struct Constants{
    static let api_key = "e0f9078e2a80c046997e4bd61c827765"
    struct Identifiers {
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let categoriesTableViewCell = "CategoriesTableViewCell"
        static let movieCollectionViewCell = "MovieCollectionViewCell"
        static let cinemaTableViewCell = "CinemaTableViewCell"
        static let allMovieCollectionViewCell = "AllMovieCollectionViewCell"
    }
    
    struct Resources {
        static let image_url: String = "https://image.tmdb.org/t/p/w500/"
        
        static let trending = "https://api.themoviedb.org/3/trending/all/day?api_key="
        static let top_rated = "https://api.themoviedb.org/3/movie/top_rated?api_key="
        static let popular = "https://api.themoviedb.org/3/movie/popular?api_key="
        static let latest = "https://api.themoviedb.org/3/movie/latest?api_key="
        
        
    }
}

enum Categories: String, CaseIterable{
    case all = "🔥All"
    case theatre = "🎭Theatre"
    case Sport = "⚽️Sport"
    case another = "🧩Another"
}

class CinemaClass{
    
    struct Cinema{
        var imageOfCinema : String
        var title : String
        var inform: String
        
        init(imageOfCinema: String, title: String, inform: String) {
            self.imageOfCinema = imageOfCinema
            self.title = title
            self.inform = inform
        }
    }
    private let listOfCinemas : [Cinema]
    
    private let cin1 = Cinema(imageOfCinema: "pic1", title: "Cinemax Dostyk Multiplex", inform: "Самал-2,д.111 уг ул Жолдасбекова ТРЦ <Достык Плаза>")
    private let cin2 = Cinema(imageOfCinema: "pic2", title: "Lumiera Cinema (ЦУМ)", inform: "пр Абылай хана 62 <Арбат>")
    private let cin3 = Cinema(imageOfCinema: "pic3", title: "Kinoforum 10 (ТРЦ Forum)", inform: "ул Сейфуллина 617 ТРЦ <Форум Алматы 5-й этаж>")
    private let cin4 = Cinema(imageOfCinema: "pic4", title: "Kinopark 11 (Есентай) IMAX", inform: "пр Аль-Фараби 77/8 ТЦ <Esentai Mall>")
    private let cin5 = Cinema(imageOfCinema: "pic5", title: "Chaplin MEGA Alma-Ata", inform: "ул Розыбакиева 247А ТРЦ <MEGA Alma-ata>")
    private let cin6 = Cinema(imageOfCinema: "pic6", title: "Chaplin MEGA Park(ул Макатаева)", inform: "ул Макатаева 123 3-й этаж")
    private let cin7 = Cinema(imageOfCinema: "pic1", title: "Cinemax Dostyk Multiplex", inform: "Самал-2,д.111 уг ул Жолдасбекова ТРЦ <Достык Плаза>")
    private let cin8 = Cinema(imageOfCinema: "pic2", title: "Lumiera Cinema (ЦУМ)", inform: "пр Абылай хана 62 <Арбат>")
    private let cin9 = Cinema(imageOfCinema: "pic3", title: "Kinoforum 10 (ТРЦ Forum)", inform: "ул Сейфуллина 617 ТРЦ <Форум Алматы 5-й этаж>")
    private let cin10 = Cinema(imageOfCinema: "pic4", title: "Kinopark 11 (Есентай) IMAX", inform: "пр Аль-Фараби 77/8 ТЦ <Esentai Mall>")
    private let cin11 = Cinema(imageOfCinema: "pic5", title: "Chaplin MEGA Alma-Ata", inform: "ул Розыбакиева 247А ТРЦ <MEGA Alma-ata>")
    private let cin12 = Cinema(imageOfCinema: "pic6", title: "Chaplin MEGA Park(ул Макатаева)", inform: "ул Макатаева 123 3-й этаж")
    
    
    public func getListOfCinemas() -> [Cinema]{
        return listOfCinemas
    }
    
    init(){
         listOfCinemas = [cin1,cin2,cin3,cin4,cin5,cin6,cin7,cin8,cin9,cin10,cin11,cin12]
    }
    
    
}
