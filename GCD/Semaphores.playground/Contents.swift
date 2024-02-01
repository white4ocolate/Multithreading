import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


let queue = DispatchQueue(label: "Queue fro semaphore", attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 0) // how many thgreads allow

queue.async {
    semaphore.wait(timeout: .distantFuture)
    Thread.sleep(forTimeInterval: 4)
    print("----------Block 1----------")
    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    Thread.sleep(forTimeInterval: 2)
    print("----------Block 2----------")
    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    print("----------Block 3----------")
    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    print("----------Block 4----------")
    semaphore.signal()
}

let semaphore2 = DispatchSemaphore(value: 1)

DispatchQueue.concurrentPerform(iterations: 20) { index in
    semaphore2.wait(timeout: .distantFuture)
    print("----------Block \(index)----------")
    semaphore2.signal()
}
