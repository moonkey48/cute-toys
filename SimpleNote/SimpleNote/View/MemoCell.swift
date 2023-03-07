//
//  MemoCell.swift
//  SimpleNote
//
//  Created by Seungui Moon on 2023/03/07.
//

import UIKit

class MemoCell: UITableViewCell {

    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var memoDateLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    var memoData: Memo? {
        didSet {
            memoLabel.text = memoData?.memoContent
            memoDateLabel.text = memoData?.data
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
