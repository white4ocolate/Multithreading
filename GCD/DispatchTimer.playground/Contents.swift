import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let queue = DispatchQueue(label: "Queue for timer", attributes: .concurrent)
let timer = DispatchSource.makeTimerSource(queue: queue)

var index = 0
timer.schedule(deadline: .now(), repeating: .seconds(3), leeway: .milliseconds(100))

timer.setEventHandler {
    print("3 seconds have passed...")
    index += 1
    print("index = \(index)")
    if (index == 10) {
        timer.cancel()
    }
}
timer.resume()

timer.setCancelHandler{
    print("Timer was canceled because index = \(index)")
}


