import UIKit

public class CounterViewController: UIViewController {

    @IBOutlet public weak var counterLabel: UILabel!
    @IBOutlet public weak var plusButton: UIButton!

    public var counter: Counter!

    public override func viewDidLoad() {
        super.viewDidLoad()
        if (counter == nil) {
            counter = Counter()
        }

        NSNotificationCenter.defaultCenter().addObserver(self, 
            selector: "modelChanged:", name: CounterModelChanged, object:counter)
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction public func incrementCounter(sender: AnyObject?) {
        counter.increment()
    }
    
    func modelChanged(notification: NSNotification) {
        if let counterObj = notification.object as? Counter {
            counterLabel.text = "\(counterObj.count!)"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
