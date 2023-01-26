//
//  ViewController.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 24.01.2023.
//

import UIKit

final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
      // view.backgroundColor = .systemBackground
        
        
        let vc1 = UINavigationController(rootViewController: MovieViewController())
        let vc2 = UINavigationController(rootViewController: PlaceViewController())
        let vc3 = UINavigationController(rootViewController: TicketViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "film")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "film.fill")
        vc2.tabBarItem.image = UIImage(systemName: "safari")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "safari.fill")
        vc3.tabBarItem.image = UIImage(systemName: "ticket")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "ticket.fill")
        vc4.tabBarItem.image = UIImage(systemName: "person")
        vc4.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        vc1.title = "Poster"
        vc2.title = "Places"
        vc3.title = "Tickets"
        vc4.title = "Profile"
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
        
    }


}

