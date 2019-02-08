//
//  ViewController.swift
//  imaggaPhotos
//
//  Created by DevMountain on 2/7/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class PhotoSelectorViewController: UIViewController {
  
  @IBOutlet weak var addPhotoButton: UIButton!
  @IBOutlet weak var photoImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  @IBAction func addPhotoButtonTapped(_ sender: Any) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    let actionSheet = UIAlertController(title: "Select a Photo", message: nil, preferredStyle: .actionSheet)
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
      actionSheet.addAction(UIAlertAction(title: "Photos", style: .default, handler: { (_) in
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
      }))
    }
    if UIImagePickerController.isSourceTypeAvailable(.camera){
      actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
        imagePickerController.sourceType = UIImagePickerController.SourceType.camera
        self.present(imagePickerController, animated: true, completion: nil)
      }))
    }
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    present(actionSheet, animated: true)
  }
}

extension PhotoSelectorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true, completion: nil)
    if let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      addPhotoButton.setTitle("", for: .normal)
      photoImageView.image = photo
    }
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}
