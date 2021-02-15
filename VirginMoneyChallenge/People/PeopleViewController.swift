//
//  PeopleViewController.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 13/02/21.
//

import UIKit
import MBProgressHUD

class PeopleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var peopleArr: [People]?
    private var peopleViewModel : PeopleViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchPeople()
    }
    
    func setupUI() {
        tableView.register(UINib(nibName: "ItemTableCell", bundle: nil), forCellReuseIdentifier: ITEM_CELL_IDENTIFIER)
    }
    
    func fetchPeople() {
        if peopleArr == nil {
            MBProgressHUD.showAdded(to: view, animated: true)
        }
        peopleViewModel = PeopleViewModel()
        peopleViewModel?.updatePeopleList = {
            if let people = self.peopleViewModel?.peopleArr, people.count > 0 {
                if self.peopleArr != people {
                    self.peopleArr = self.peopleViewModel?.peopleArr
                    self.tableView.reloadData()
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}

extension PeopleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemTableCell = tableView.dequeueReusableCell(withIdentifier: ITEM_CELL_IDENTIFIER, for: indexPath) as! ItemTableCell
        cell.title = peopleArr?[indexPath.row].getFullName()
        if let jobTitle = peopleArr?[indexPath.row].jobTitle {
            cell.subtitle = jobTitle
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let people = peopleArr?[indexPath.row], let navigationController = self.navigationController {
            Coordinator().showPeopleDetail(navigationController: navigationController, people: people)
        }
    }
}

