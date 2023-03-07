//
//  MemoManager.swift
//  SimpleNote
//
//  Created by Seungui Moon on 2023/03/07.
//

import UIKit

struct Memo {
    var memoContent: String?
    var data: String?
    var done: Bool = false
}

final class MemoManager {
    
    var memoList: [Memo] = []
    
    static let shared = MemoManager()
    
    private init() {
        var memo1 = Memo(memoContent: "firstMemo", data: "\(Data())", done: false)
        var memo2 = Memo(memoContent: "firstMemo", data: "\(Data())", done: false)
        self.memoList.append(memo1)
        self.memoList.append(memo2)
    }
    
    
    func getMemoList() -> [Memo] {
        return self.memoList
    }
    
    func addNewMemo(memoStr: String) {

        var newMemo = Memo()
        newMemo.memoContent = memoStr
        newMemo.data = "\(Data())"
        newMemo.done = false
        
        memoList.append(newMemo)
        print("add new Memo Successed")
    }
}
