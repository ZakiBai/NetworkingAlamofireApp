//
//  CourseCell.swift
//  NetworkingAlamofireApp
//
//  Created by Zaki on 15.05.2023.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var lessonLabel: UILabel!
    @IBOutlet var testLabel: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    func configure(from value: Course) {
        courseNameLabel.text = value.name
        lessonLabel.text = "Number of lessons: \(value.numberOfLessons)"
        testLabel.text = "Number of tests: \(value.numberOfTests)"
        
        guard let imageURL = URL(string: value.imageUrl) else { return }
        
        networkManager.fetchData(from: imageURL) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.courseImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
