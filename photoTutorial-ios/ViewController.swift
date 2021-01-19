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
        //카메라 라이브러리 세팅
        var config = YPImagePickerConfiguration()
        config.screens = [.library, .photo, .video]
        
        //세팅을 넣는다.
        let picker = YPImagePicker(configuration: config)
        
        //사진 선택 시 진행.
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                
                //프로필 사진 변경
                //컴플레션 블럭이라서 self 빼면 안된다.
                self.profileImage.image = photo.image
            }
            //사진 선택창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        //사진 선택창 보여주기
        present(picker, animated: true, completion: nil)
    }
    //    @objc fileprivate func onProfileChangeBtnClicked(){
//        print("ViewController - onProfileChangeBtnClicked() called")
//        
//    }
}

