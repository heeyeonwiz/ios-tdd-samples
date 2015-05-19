import Quick
import Nimble

import quick_test_swift

class CounterSpec: QuickSpec {
    override func spec() {
        let counter:Counter = Counter()

        describe(".increment()") {
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

        }
    }
}
