//
//  RoomsViewController.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 13/02/21.
//

import UIKit
import MBProgressHUD

class RoomsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private var roomViewModel : RoomsViewModel?
    private var roomsArr: [Room]?
    
    let cellIdentifier = "RoomCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        if #available(iOS 13.0, *) {
            segmentedControl.selectedSegmentTintColor = BRAND_COLOR
        } else {
            // Fallback on earlier versions
            segmentedControl.tintColor = BRAND_COLOR
        }
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        tableView.register(UINib(nibName: "ItemTableCell", bundle: nil), forCellReuseIdentifier: ITEM_CELL_IDENTIFIER)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchRooms()
    }
    
    func fetchRooms() {
        if roomsArr == nil {
            MBProgressHUD.showAdded(to: view, animated: true)
        }
        
        roomViewModel = RoomsViewModel()
        roomViewModel?.updateRoomList = {
            if let rooms = self.roomViewModel?.roomArr, rooms.count > 0 {
                if self.roomsArr != rooms {
                    self.roomsArr = rooms
                    self.showSelectedRooms()
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    @IBAction func showSelectedRooms() {
        if segmentedControl.selectedSegmentIndex == 0 {
            roomsArr = roomViewModel?.getAvailableRooms()
        } else {
            roomsArr = roomViewModel?.getOccupiedRooms()
        }
        tableView.reloadData()
    }
    
}

extension RoomsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomsArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemTableCell = tableView.dequeueReusableCell(withIdentifier: ITEM_CELL_IDENTIFIER, for: indexPath) as! ItemTableCell
        cell.title = roomsArr?[indexPath.row].name
        cell.attrubutedSubtitle = roomsArr?[indexPath.row].getOccupancyString()
        cell.hideDisclosureIcon = true
        return cell
    }
}

