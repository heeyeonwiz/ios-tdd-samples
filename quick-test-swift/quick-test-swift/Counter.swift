import Foundation

public let CounterModelChanged = "CounterModelChanged"

public class Counter {
    public var count:Int?

    public init() {
        count = 0
    }

    public func increment() {
        count!++
        NSNotificationCenter.defaultCenter().postNotificationName(CounterModelChanged, object:self)
    }

    public func decrement() {
        count!--
        NSNotificationCenter.defaultCenter().postNotificationName(CounterModelChanged, object:self)
    }
}
