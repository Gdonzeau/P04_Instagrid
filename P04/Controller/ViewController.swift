//
//  ViewController.swift
//  P04
//
//  Created by Guillaume Donzeau on 05/03/2021.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var app = Application()
    var rank = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        start()
        
        print("Début")
        
    }
    
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!
    @IBOutlet weak var button03: UIButton!
    
    @IBOutlet weak var SquareUpLeft: UIButton!
    @IBOutlet weak var SquareUpRight: UIButton!
    @IBOutlet weak var SquareDownLeft: UIButton!
    @IBOutlet weak var SquareDownRight: UIButton!
    
    @IBOutlet weak var SwipeToShare: UILabel!
    @IBOutlet weak var Arrow: UIButton!
    
    @IBOutlet weak var FinalImage: UIView!
    
    
    //var ImageLeft = ("Arrow Left")
    
    override func didRotate(from fromInterfaceOrientation : UIInterfaceOrientation) {
        if fromInterfaceOrientation == .portrait || fromInterfaceOrientation == .portraitUpsideDown{
            //if fromInterfaceOrientation == .landscapeLeft || fromInterfaceOrientation == .landscapeRight{
            SwipeToShare.text = "Swipe left to share"
            Arrow.setImage(UIImage(imageLiteralResourceName: "Arrow Left"), for: .normal)
        } else {
            SwipeToShare.text = "Swipe up to share"
            Arrow.setImage(UIImage(imageLiteralResourceName: "Arrow Up"), for: .normal)
        }
    }
    
    
    @IBAction func LongButtonSquareUpLeft(_ sender: UILongPressGestureRecognizer) {
        rank = 1
        findCamera()
        SquareUpLeft.imageView?.contentMode = .scaleAspectFill
        //SquareUpLeft.imageView?.contentMode = .clipsToBounds
        
        
    }
    @IBAction func LongButtonSquareUpRight(_ sender: UILongPressGestureRecognizer) {
        rank = 2
        findCamera()
        SquareUpRight.imageView?.contentMode = .scaleAspectFill
    }
    
    @IBAction func LongButtonSquareDownLeft(_ sender: UILongPressGestureRecognizer) {
        rank = 3
        findCamera()
        SquareDownLeft.imageView?.contentMode = .scaleAspectFill
    }
    
    @IBAction func LongButtonSquareDownRight(_ sender: UILongPressGestureRecognizer) {
        rank = 4
        findCamera()
        SquareDownRight.imageView?.contentMode = .scaleAspectFill
    }
    
    
    @IBAction func ButtonSquareUpLeft() {
        rank = 1
        findImage()
        SquareUpLeft.imageView?.contentMode = .scaleAspectFill
        
    }
    @IBAction func ButtonSquareUpRight() {
        rank = 2
        findImage()
        SquareUpRight.imageView?.contentMode = .scaleAspectFill
    }
    
    @IBAction func ButtonSquareDownLeft() {
        rank = 3
        findImage()
        SquareDownLeft.imageView?.contentMode = .scaleAspectFill
    }
    
    @IBAction func ButtonSquareDownRight() {
        rank = 4
        findImage()
        SquareDownRight.imageView?.contentMode = .scaleAspectFill
    }
    
    func findImage() {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        //image.sourceType = UIImagePickerController.SourceType.camera
        
        image.allowsEditing = false
        
        present(image, animated: true)
        {
            // After
        }
    }
    func findCamera() {
        let image = UIImagePickerController()
        image.delegate = self
        
        //image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.sourceType = UIImagePickerController.SourceType.camera
        
        image.allowsEditing = false
        
        present(image, animated: true)
        {
            // After
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            switch rank {
            case 1:
                SquareUpLeft.setImage(image, for: .normal)
            case 2:
                SquareUpRight.setImage(image, for: .normal)
            case 3:
                SquareDownLeft.setImage(image, for: .normal)
            case 4:
                SquareDownRight.setImage(image, for: .normal)
            default:
                print("???")
            }
            
        } else {
            // Message d'erreur
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Bouton1() {
        button01.setImage(UIImage(imageLiteralResourceName: "Selected"), for: .normal)
        button02.setImage(UIImage(imageLiteralResourceName: "Layout 2"), for: .normal)
        button03.setImage(UIImage(imageLiteralResourceName: "Layout 3"), for: .normal)
        SquareUpLeft.isHidden = true
        SquareUpRight.isHidden = false
        SquareDownLeft.isHidden = false
        SquareDownRight.isHidden = false
    }
    
    @IBAction func Bouton2() {
        button01.setImage(UIImage(imageLiteralResourceName: "Layout 1"), for: .normal)
        button02.setImage(UIImage(imageLiteralResourceName: "Selected"), for: .normal)
        button03.setImage(UIImage(imageLiteralResourceName: "Layout 3"), for: .normal)
        SquareUpLeft.isHidden = false
        SquareUpRight.isHidden = false
        SquareDownLeft.isHidden = true
        SquareDownRight.isHidden = false
    }
    
    @IBAction func Bouton3() {
        button01.setImage(UIImage(imageLiteralResourceName: "Layout 1"), for: .normal)
        button02.setImage(UIImage(imageLiteralResourceName: "Layout 2"), for: .normal)
        button03.setImage(UIImage(imageLiteralResourceName: "Selected"), for: .normal)
        SquareUpLeft.isHidden = false
        SquareUpRight.isHidden = false
        SquareDownLeft.isHidden = false
        SquareDownRight.isHidden = false
    }
    
    private func start() {
        button01.setImage(UIImage(imageLiteralResourceName: "Selected"), for: .normal)
        button02.setImage(UIImage(imageLiteralResourceName: "Layout 2"), for: .normal)
        button03.setImage(UIImage(imageLiteralResourceName: "Layout 3"), for: .normal)
        SquareUpLeft.isHidden = true
        SquareUpRight.isHidden = false
        SquareDownLeft.isHidden = false
        SquareDownRight.isHidden = false
    }
    
    @IBAction func SwipeUp(_ sender: UISwipeGestureRecognizer) {
        if SwipeToShare.text == "Swipe up to share" {
            print("Up")
            
            let renderer = UIGraphicsImageRenderer(size: FinalImage.bounds.size)
            let image = renderer.image { ctx in
                FinalImage.drawHierarchy(in: FinalImage.bounds, afterScreenUpdates: true)
            }
            
            let screenHeight = UIScreen.main.bounds.height
            var translationTransform: CGAffineTransform
            var translationBackTransform: CGAffineTransform
            
            translationTransform = CGAffineTransform(translationX: 0, y: -screenHeight)
            translationBackTransform = CGAffineTransform(translationX: 0, y: 0)
            
            UIView.animate(withDuration: 0.3) {
                self.FinalImage.transform = translationTransform
            }
            // Envoi photo
            
            let items = [image]
            let sendPhoto = UIActivityViewController(activityItems: items, applicationActivities: nil)
            present(sendPhoto, animated: true)
            
            sendPhoto.completionWithItemsHandler = { activity, success, items, error in
                print("activity: \(String(describing: activity)), success: \(success), items: \(String(describing: items)), error: \(String(describing: error))")
                
                
                UIView.animate(withDuration: 0.3) {
                    self.FinalImage.transform = translationBackTransform
                }
 
            }
        }
    }
    @IBAction func SwipeDown(_ sender: UISwipeGestureRecognizer) {
        
        var translationBackTransform: CGAffineTransform
        
        translationBackTransform = CGAffineTransform(translationX: 0, y: 0)
        UIView.animate(withDuration: 0.3) {
            self.FinalImage.transform = translationBackTransform
        }
    }
    
    @IBAction func SwipeRight(_ sender: UISwipeGestureRecognizer) {
        
        var translationBackTransform: CGAffineTransform
        
        translationBackTransform = CGAffineTransform(translationX: 0, y: 0)
        
        UIView.animate(withDuration: 0.3) {
            self.FinalImage.transform = translationBackTransform
        }
    }
    
    
    @IBAction func SwipeLeft(_ sender: UISwipeGestureRecognizer) {
        if SwipeToShare.text == "Swipe left to share" {
            print("Left")
            //var uneFois = 0
            let renderer = UIGraphicsImageRenderer(size: FinalImage.bounds.size)
            let image = renderer.image { ctx in
                FinalImage.drawHierarchy(in: FinalImage.bounds, afterScreenUpdates: true)
            }
            
            let screenWidth = UIScreen.main.bounds.width
            var translationTransform: CGAffineTransform
            var translationBackTransform: CGAffineTransform
            
            translationTransform = CGAffineTransform(translationX: -screenWidth, y: 0)
            translationBackTransform = CGAffineTransform(translationX: 0, y: 0)
            UIView.animate(withDuration: 0.3) {
                self.FinalImage.transform = translationTransform
                print("Anim")
            }
            
            let items = [image]
            let sendPhoto = UIActivityViewController(activityItems: items, applicationActivities: nil)
            present(sendPhoto, animated: true)
            
            sendPhoto.completionWithItemsHandler = { activity, success, items, error in
                UIView.animate(withDuration: 0.3) {
                self.FinalImage.transform = translationBackTransform
            }
                
            }
        }
    }
}

