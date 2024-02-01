import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


let queue = DispatchQueue(label: "DispatchWorkItem1", attributes: .concurrent)

//        let workItem = DispatchWorkItem {
//            print("Start Task")
//            print(Thread.current)
//        }
//        let group = DispatchGroup()
//        queue.async(group: group) {
//            for i in 1...100000 {
//                print(i)
//            }
//        }
//
//        queue.async(group: group) {
//            for i in 1...200000 {
//                print(i)
//            }
//        }

//        group.notify(queue: .main) {
//            print("all groups done...!")
//        }

let secongGroup = DispatchGroup()
secongGroup.enter()
queue.async(group: secongGroup) {
    for i in 1...100000 {
        print(i)
        if i == 100000 {
            secongGroup.leave()
        }
    }
}
var result = secongGroup.wait(timeout: .now())
print(result)

secongGroup.notify(queue: .main) {
    print("Second group is done")
}
print("This text before wait")
secongGroup.wait()
print("This text after wait")
