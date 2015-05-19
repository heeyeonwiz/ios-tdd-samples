import Foundation

public let CounterModelChanged = "CounterModelChanged"

public class Counter {
    public var count:Int?

    public init() {
        count = 0
    }

    public func increment() {
        count!++
        postNotification()
    }

    public func decrement() {
        count!--
        postNotification()
    }
    
    func postNotification() {
        NSNotificationCenter.defaultCenter().postNotificationName(CounterModelChanged, object:self)
    }
}
