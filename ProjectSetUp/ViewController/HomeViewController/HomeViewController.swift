//
//  HomeViewController.swift
//  ProjectSetUp
//
//  Created by PSSPL on 04/05/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var viewHeader: HeaderView!
    var objHomeViewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    func configureData() {
        objHomeViewModel.setUpHeaderView(viewHeader: viewHeader)
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
