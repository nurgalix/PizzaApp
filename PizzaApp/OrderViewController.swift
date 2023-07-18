//
//  OrderViewController.swift
//  PizzaApp
//
//  Created by Nurgali on 08.07.2023.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var arrayOrder: UILabel!
    
    
    var list: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(updateArray(_:)), name: NSNotification.Name("MyModelArrayUpdated"), object: nil)
    }
    
    @objc func updateArray(_ notification: Notification) {
        // Update your UI elements with the modified array
        // For example, reload your UITableView with the updated data
        // MyModel.shared.dataArray contains the updated array
        arrayOrder.text = MyModel.shared.dataArray[0]
        list = MyModel.shared.dataArray
        print(MyModel.shared.dataArray)
        tableView.reloadData()
    }
    
    deinit {
        // Unsubscribe from notifications when the view controller is deallocated
        NotificationCenter.default.removeObserver(self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension OrderViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableViewCell
        cell.title.text = list[indexPath.row]
        return cell
    }
}
