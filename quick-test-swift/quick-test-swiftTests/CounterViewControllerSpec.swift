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
            describe("counterLabel") {
                it("should be connected") {
                   expect(controller.counterLabel).toNot(beNil())
                }

                it("should have zero text by default") {
                    expect(controller.counterLabel.text).to(equal("0"))
                }
            }
        }
    }
}
