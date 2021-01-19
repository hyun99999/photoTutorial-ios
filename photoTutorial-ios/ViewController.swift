//
//  ViewController.swift
//  photoTutorial-ios
//
//  Created by kimhyungyu on 2021/01/19.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileChangeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileChangeBtn.layer.cornerRadius = 10
        
//        profileChangeBtn.addTarget(self, action: #selector(onProfileChangeBtnClicked), for: .touchUpInside)
    }

    @IBAction func onProfileChangeBtnClicked(_ sender: Any) {
        print("ViewController - onProfileChangeBtnClicked() called")
        let picker = YPImagePicker()
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
    //    @objc fileprivate func onProfileChangeBtnClicked(){
//        print("ViewController - onProfileChangeBtnClicked() called")
//        
//    }
}

