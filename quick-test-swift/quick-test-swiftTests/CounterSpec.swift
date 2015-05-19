import Quick
import Nimble

import quick_test_swift

class CounterSpec: QuickSpec {
    var modelChangedCount:Int?
    var modelChangedValue:Int?
    
    func counterModelChanged(notification:NSNotification) {
        modelChangedCount!++
        if let counter = notification.object as? Counter {
            modelChangedValue = counter.count
        }
    }
    
    override func spec() {
        let counter:Counter = Counter()

        describe(".increment()") {            
            beforeEach {                
                self.modelChangedCount = 0
                self.modelChangedValue = 0
                NSNotificationCenter.defaultCenter().addObserver(self,
                                                        selector: "counterModelChanged:", 
                                                            name: CounterModelChanged,
                                                          object: counter)
            }
            
            afterEach {
                NSNotificationCenter.defaultCenter().removeObserver(self)
            }
            
            
            it("should increment 1 to 2") {
                counter.count = 1
                counter.increment()
                expect(counter.count).to(equal(2))
            }

            it("should increment 2 to 3") {
                counter.count = 2
                counter.increment()
                expect(counter.count).to(equal(3))
            }
            
            it("should post model changed notification") {
                counter.count = 2
                counter.increment()
                expect(self.modelChangedCount).to(equal(1))
            }            
            
            it("should post model changed notification with new count ") {
                counter.count = 20
                counter.increment()
                expect(self.modelChangedValue).to(equal(21))
            }
        }

        describe(".decrement()") {
            it("should increment 2 to 1") {
                counter.count = 2
                counter.decrement()
                expect(counter.count).to(equal(1))
            }

            it("should increment 3 to 2") {
                counter.count = 3
                counter.decrement()
                expect(counter.count).to(equal(2))
            }
        }
    }
}
