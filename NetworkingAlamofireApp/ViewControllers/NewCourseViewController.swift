//
//  NewCourseViewController.swift
//  NetworkingAlamofireApp
//
//  Created by Zaki on 15.05.2023.
//

import UIKit

class NewCourseViewController: UIViewController {

    @IBOutlet var courseNameTF: UITextField!
    @IBOutlet var lessonTF: UITextField!
    @IBOutlet var testTF: UITextField!
    
    weak var delegate: NewCourseViewControllerDelegate?
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        let course = Course(
            name: courseNameTF.text ?? "Noname",
            imageUrl: Link.courseImageURL.url.absoluteString,
            number_of_lessons: Int(lessonTF.text ?? "") ?? 0,
            number_of_tests: Int(testTF.text ?? "") ?? 0
        )
        
        delegate?.sendPostRequest(with: course)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
}
