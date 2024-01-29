import UIKit
// C
//class SaveThread {
//    private var mutex = pthread_mutex_t()
//     
//    init() {
//        pthread_mutex_init(&mutex, nil)
//    }
//    
//    func someMethod(completion: ()->()) {
//        pthread_mutex_lock(&mutex)
//        completion()
//        defer {
//            pthread_mutex_unlock(&mutex)
//        }
//    }
//}

// obj-C
class SaveThread {
    private let lockMutex = NSLock()
    
    func someMethod(completion: ()->()) {
        lockMutex.lock()
        completion()
        defer {
            lockMutex.unlock()
        }
    }
}

var array = [Int]()

var saveThread = SaveThread()


saveThread.someMethod {
    print("test")
    for i in 0...999 {
        array.append(i)
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...999 {
        array.append(i)
    }
    
}
