import UIKit

// C
//class RecursiveMutexText {
//    private var mutex = pthread_mutex_t()
//
//    private var attribute = pthread_mutexattr_t()
//
//    init() {
//        pthread_mutexattr_init(&attribute)
//        pthread_mutexattr_settype(&attribute, PTHREAD_MUTEX_RECURSIVE)
//
//        pthread_mutex_init(&mutex, &attribute)
//    }
//
//    fileprivate func firstMethod(){
//        pthread_mutex_lock(&mutex)
//        secondMethod()
//        defer{
//            pthread_mutex_unlock(&mutex)
//        }
//    }
//
//    private func secondMethod(){
//        pthread_mutex_lock(&mutex)
//        print("finish")
//        defer{
//            pthread_mutex_unlock(&mutex)
//        }
//    }
//}
//
//RecursiveMutexText().firstMethod()


//obj-C
var recursiveLock = NSRecursiveLock()

class RecursiveThread: Thread {
    override func main() {
        recursiveLock.lock()
        print("Thread in main was locked")
        callMe()
        defer {
            recursiveLock.unlock()
            print("unlock in main")
        }
        print("Exit main")
    }
    
    func callMe() {
        recursiveLock.lock()
        print("Thread in callMe was locked")
        defer {
            recursiveLock.unlock()
            print("unlock in callMe")
        }
        print("Exit callMe")
    }
}

RecursiveThread().start()
