//
//  ViewController.swift
//  photoTutorial-ios
//
//  Created by kimhyungyu on 2021/01/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileChangeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileChangeBtn.layer.cornerRadius = 10
        
    }


}

