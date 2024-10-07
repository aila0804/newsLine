//
//  TableViewController.swift
//  newsline
//
//  Created by Aila Aila on 27.09.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    var timer = Timer()
    var arrayNews = [
        News(title: "Pills: Does the color matter?", detail: "Several studies have found that the color of the pills we take can have a subliminal effect on how we think those medicines will work. Even if the pills themselves are nothing more than a placebo, their color scheme convinces our brain and body that we have taken an active compound.In other words, we are highly suggestible, and the placebo effect is strong and highly complicated in nature.", dateTimeLabel: ""),
        News(title: "One pound of lead", detail: "What weighs more: 1 pound of lead or 1 pound of feathers? This classic trick question might have a slightly illogical “true” answer. Of course, empirically, a pound of lead and a pound of feathers weigh the same amount. But when this is put to the test with unsuspecting human subjects, things get a little more confusing. Surprisingly, more often than chance, the participants reported that the box containing lead was heavier.", dateTimeLabel: ""),
    News(title: "Birth control pills and blinking", detail: "In 1994, researchers found that women who take birth control pills blink more oftenTrusted Source than women who do not. Quite a lot more, actually; on average, the study found, women on birth control pills blink about 32 percent more than women not using this method of contraception.", dateTimeLabel: "")
    
        ]
    
//    let array = [1, 2, 3, 4, 5]
    
//    let date = Date()
//    let calendar = Calendar.current
//    let hour = calendar.component(.hour, from: date)
//    let minute = calendar.component(.minute, from: date)
//    let second = calendar.component(.second, from: date)
    
    @objc func addNews() {
        arrayNews.insert(arrayNews[1], at: 0)
        tableView.reloadData()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 5.5, target: self, selector: #selector(addNews), userInfo: nil, repeats: true)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNews.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let labelNewsTitle = cell.viewWithTag(1) as! UILabel
        labelNewsTitle.text = arrayNews[indexPath.row].title
        
        let labelNewsDetail = cell.viewWithTag(2) as! UILabel
        labelNewsDetail.text = arrayNews[indexPath.row].detail
        
        let labelNewsDate = cell.viewWithTag(3) as! UILabel
        labelNewsDate.text = arrayNews[indexPath.row].dateTimeLabel
        
        let dateFormatter = DateFormatter()
        let todayDate = Date()
        dateFormatter.dateFormat = "dd.MM.y HH:mm:ss"
        let formattedDate = dateFormatter.string(from: todayDate)
        labelNewsDate.text = String(formattedDate)
        
        
        // Configure the cell...
        
//        let label = cell.viewWithTag(1000) as! UILabel
//        label.text = "\(array[indexPath.row])"
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
