//
//  Member.swift
//  MemberList
//
//  Created by Kang on 2023/09/06.
//

import UIKit

// 커스텀 델리게이트
protocol memberDelegate: AnyObject {
    // 멤버 추가
    func addNewMember(newMember: Member)
    // 멤버 업데이트
    func updateMember(indexPath: Int, _ member: Member)
}

struct Member {
    
    // 멤버 이미지
    lazy var memberImage: UIImage? = {
        // 이름이 없다면(새로 추가하는 경우) -> 시스템 이미지 리턴
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        
        // 이름이 있다면(업데이트 하는 경우) -> 해당 이미지 or 시스템 이미지 리턴
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    // 멤버 cnt, ID, 이미지, 이름, 나이, 전화번호, 주소
    static var memberCnt: Int = 0
    let memberID: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    // 생성자 구현
    init(name: String?, age: Int?, phone: String?, address: String?) {
        self.memberID = Member.memberCnt
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        Member.memberCnt += 1
    } 
}
