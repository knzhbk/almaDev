//
//  ScoreBoardViewController.swift
//  AlmaDev
//
//  Created by Adina Kenzhebekova on 5/25/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ScoreBoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
        
    let scores = [
        Score(subject: "Geography", score: 5),
        Score(subject: "Math", score: 66),
        Score(subject: "Music", score: 18),
        Score(subject: "Films", score: 22)
    ]
    let cellReuseId = "ScoreCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as! ScoreCell
        let score = scores[indexPath.item]

        cell.subjectLabel?.text = score.subject
        cell.orderLabel?.text = "\(indexPath.row+1)"//to start from 1
        cell.scoreLabel?.text = "\(score.score)"
        
        cell.contentView.backgroundColor = #colorLiteral(red: 0.3354575038, green: 0.2025706172, blue: 0.4994072318, alpha: 1)
        let whiteRoundedView = UIView(frame: CGRect(x: 0, y: 7, width: self.view.frame.size.width, height: 70))
        if score.score < 10 {
            whiteRoundedView.layer.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
        } else {
            whiteRoundedView.layer.backgroundColor = #colorLiteral(red: 0.2349021435, green: 0.6835666299, blue: 0.4237295985, alpha: 1)
        }
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 10.0

        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubviewToBack(whiteRoundedView)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
