import UIKit

//0
class StocksTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //1
    private let stocks = ["AAPL","FB","GOOG"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //2
    //UITableViewDataSource
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int  {
    return stocks.count
    }
    
    //3
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cellId")
    cell.textLabel.text = stocks[indexPath.row]
    return cell
    }
    
    //4
    //UITableViewDelegate
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        NSLog("cell clicked")
    }
}