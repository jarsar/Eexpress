//
//  UserViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/11/7.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
class UserViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK:Properties
    @IBOutlet weak var headimageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var user:User?
    var image:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let getimage = loadimage(){
            headimageView.image=getimage
        }
        if let saveduser=loaduser(){
            user=saveduser
        }
        name.text=user?.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        headimageView.image = selectedImage
        self.image=headimageView.image
        saveimage()
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:Action
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    private func loaduser()->User?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? User
    }
    
    private func loadimage()->UIImage?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: UserImage.ArchiveURL.path) as? UIImage
    }
    
    private func saveimage(){
        let isSuccessfulSaveImage = NSKeyedArchiver.archiveRootObject(image, toFile: UserImage.ArchiveURL.path)
        if isSuccessfulSaveImage {
            os_log("image successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save image...", log: OSLog.default, type: .error)
        }
    }
}
