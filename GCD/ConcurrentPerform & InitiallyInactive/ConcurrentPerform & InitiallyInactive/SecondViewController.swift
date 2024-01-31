
import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        DispatchQueue.global(qos: .utility).async {
//            DispatchQueue.concurrentPerform(iterations: 100000) { index in
//                print(index)
//                print(Thread.current)
//            }
//        }
        myInactiveQueue()
    }
    
    func myInactiveQueue() {
        var inactiveQueue = DispatchQueue(label: "inactiveQueue", attributes: [.concurrent, .initiallyInactive])
        
        inactiveQueue.async {
            print("Done!")
        }
        print("Not yet started...")
        
        inactiveQueue.activate()
        print("Activate!")
        
        inactiveQueue.suspend()
        print("Pause!")
        
        inactiveQueue.resume()
        
        
    }
}
