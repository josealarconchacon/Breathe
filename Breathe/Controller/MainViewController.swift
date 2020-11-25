//
//  ViewController.swift
//  Breathe
//
//  Created by Jose Alarcon Chacon on 11/23/20.
//

import UIKit
import BonsaiController

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    

    var cadence = ["cadence 1","cadence 2","cadence 3","cadence 4","cadence 5","cadence 6"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cadence.count
    }    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        let data = cadence[indexPath.row]
        cell.cadenceLabel.text = data
//        cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let smallView = storyboard!.instantiateViewController(identifier: "SmallView")
        smallView.transitioningDelegate = self
        smallView.modalPresentationStyle = .custom
        present(smallView, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.destination is YourViewController {
            segue.destination.transitioningDelegate = self
            segue.destination.modalPresentationStyle = .custom
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}


extension MainViewController: BonsaiControllerDelegate {
    func frameOfPresentedView(in containerViewFrame: CGRect) -> CGRect {
        return CGRect(origin: CGPoint(x: 0, y: containerViewFrame.height / 1.3), size: CGSize(width: containerViewFrame.width, height: containerViewFrame.height / (3/4)))
        }
        func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
            return BonsaiController(fromDirection: .bottom, blurEffectStyle: .light, presentedViewController: presented, delegate: self)
        }
}
