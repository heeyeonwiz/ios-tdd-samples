import UIKit
import Quick
import Nimble

import quick_test_swift

class CounterViewControllerSpec: QuickSpec {
    override func spec() {

        var controller: CounterViewController!
        beforeEach {
            let storyboard = UIStoryboard(name:"Main", bundle: NSBundle.mainBundle())
            controller = storyboard.instantiateViewControllerWithIdentifier("counterViewController") as! CounterViewController
            let _ = controller.view
        }

        describe(".viewDidiLoad()") {
            describe("Counter") {
                it("") {
                    expect(controller.counter).toNot(beNil())
                }
            }

            describe("counterLabel") {
                it("should be connected") {
                   expect(controller.counterLabel).toNot(beNil())
                }

                it("should have zero text by default") {
                    expect(controller.counterLabel.text).to(equal("0"))
                }
                
                it("should have black text color by default") {
                    expect(controller.counterLabel.textColor).to(equal(UIColor.blackColor()))
                }
            }

            describe("plusButton") {
                it("should be connected") {
                    expect(controller.plusButton).toNot(beNil())
                }

                it("should observe action") {
                    expect(controller.plusButton.actionsForTarget(controller,
                            forControlEvent: UIControlEvents.TouchUpInside)
                    ).to(contain("incrementCounter:"))
                }
            }
            
            describe("minusButton") {
                it("should be connected") {
                    expect(controller.minusButton).toNot(beNil())
                }

                it("should observe action") {
                    expect(controller.minusButton.actionsForTarget(controller,
                            forControlEvent: UIControlEvents.TouchUpInside)
                    ).to(contain("decrementCounter:"))
                }
            }
        }

        describe("incrementCounter") {

            class MockCounter: Counter {
                var invokeCount:Int?
                override init() {
                    invokeCount = 0
                    super.init()
                }
                override func increment() {
                    invokeCount!++
                }
            }

            beforeEach {
                let mockCounter:MockCounter = MockCounter()
                controller.counter = mockCounter
            }

            it("should ask counter to incremet") {
                controller.incrementCounter(nil)

                expect((controller.counter as! MockCounter).invokeCount).to(equal(1))
            }
        }
        
        describe("decrementCounter") {
            class MockCounter: Counter {
                var invokeCount:Int?
                override init() {
                    invokeCount = 0
                    super.init()
                }
                override func decrement() {
                    invokeCount!++
                }
            }

            beforeEach {
                let mockCounter:MockCounter = MockCounter()
                controller.counter = mockCounter
            }

            it("should ask counter to decremet") {
                controller.decrementCounter(nil)

                expect((controller.counter as! MockCounter).invokeCount).to(equal(1))
            }
        }

        describe("model changed notification") {
            
            it("should update counter label") {
                controller.counter.count = 2
                NSNotificationCenter.defaultCenter()
                    .postNotificationName(CounterModelChanged, object:controller.counter)
                expect(controller.counterLabel.text).to(equal("2"))
            }
            
            context("from different model") {
                it("should not update counter label") {
                    let diffCounter:Counter = Counter()
                    diffCounter.count = 22
                    NSNotificationCenter.defaultCenter().postNotificationName(CounterModelChanged, object:diffCounter)
                    expect(controller.counterLabel.text).to(equal("0"))
                }
            }
        }
        
        describe(".updateCounterLabel()") {
            context("with zero") {
                it("should have black text color") {
                    controller.updateCounterLabel(0)
                    expect(controller.counterLabel.textColor).to(equal(UIColor.blackColor()))
                }
            }
            
            context("with positive number") {
                it("should have green text color") {
                    controller.updateCounterLabel(1)
                    expect(controller.counterLabel.textColor).to(equal(UIColor.greenColor()))
                }
            }
            
            context("with negative number") {
                it("should have green text color") {
                    controller.updateCounterLabel(-1)
                    expect(controller.counterLabel.textColor).to(equal(UIColor.redColor()))
                }
            }
        }
    }
}
