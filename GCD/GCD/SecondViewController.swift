
import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageViewCat: UIImageView!
    @IBOutlet weak var activityIndicatorCat: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicatorDog: UIActivityIndicatorView!
    @IBOutlet weak var imageViewDog: UIImageView!
    
    fileprivate var imageURlCat: URL?
    fileprivate var imageURlDog: URL?
    fileprivate var imageCat: UIImage? {
        get {
            return imageViewCat.image
        }
        set {
            activityIndicatorCat.startAnimating()
            activityIndicatorCat.isHidden = true
            imageViewCat.image = newValue
            imageViewCat.sizeToFit()
            
        }
    }
    fileprivate var imageDog: UIImage? {
        get {
            return imageViewDog.image
        }
        set {
            activityIndicatorDog.startAnimating()
            activityIndicatorDog.isHidden = true
            imageViewDog.image = newValue
            imageViewDog.sizeToFit()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        delay(5) {
            self.alertLogIn()
        }
 
    }
    
    fileprivate func delay(_ delay: Int, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)){
            closure()
        }
    }
    
    fileprivate func alertLogIn() {
        let alertController = UIAlertController(title: "Are you registered?", message: "Please enter your login and password.", preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(okAlertAction)
        alertController.addAction(cancelAction)
        
        alertController.addTextField{ (userNameTF) in
            userNameTF.placeholder = "Enter your login"
        }
        
        alertController.addTextField{ (userNameTF) in
            userNameTF.placeholder = "Enter your password"
            userNameTF.isSecureTextEntry = true
        }
        self.present(alertController, animated: true)
    }
    
    fileprivate func fetchImage() {
        imageURlCat = URL(string: "https://images.alphacoders.com/112/1121736.jpg")
        imageURlDog = URL(string: "https://wallpapercave.com/wp/wp12412506.jpg")
        activityIndicatorCat.isHidden = false
        activityIndicatorDog.isHidden = false
        activityIndicatorCat.startAnimating()
        activityIndicatorDog.startAnimating()

        DispatchQueue.global(qos: .utility).async {
            guard let url = self.imageURlCat, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.imageCat = UIImage(data: imageData)
            }
        }
        DispatchQueue.global(qos: .utility).async {
            guard let url = self.imageURlDog, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.imageDog = UIImage(data: imageData)
            }
        }
    }
}
