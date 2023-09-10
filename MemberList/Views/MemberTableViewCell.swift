//
//  MemberTableViewCell.swift
//  MemberList
//
//  Created by Kang on 2023/09/06.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    // MARK: - 변수 선언
    // 멤버 데이터 사용
    var member: Member? {
        // 멤버 내의 속성이 변하면 -> 할당을 실행
        didSet {
            guard var member = member else { return }
            memberImageView.image = member.memberImage
            nameLabel.text = member.name
            addressLabel.text = member.address
        }
    }
    // 이미지 뷰
    lazy var memberImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 이름 레이블
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 주소 레이블
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 스택뷰
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, addressLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        // 메인 셋업
        setupMain()
    }
    
    // 오토 레이아웃 설정
    override func updateConstraints() {
        setAutoLayout()
        super.updateConstraints()
    }
    
    // 멤버 이미지 원으로 설정
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 원으로 설정
        self.memberImageView.clipsToBounds = true
        self.memberImageView.layer.cornerRadius = self.memberImageView.frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - 셋업
    // 메인 셋업
    func setupMain() {
        // self.backgroundColor = .white
        
        // 스택 뷰 셋업
        setupAddSubView()
    }
    
    
    // 오토 레이아웃 셋업
    func setAutoLayout() {
        
        // 멤버 이미지 오토 레이아웃
        NSLayoutConstraint.activate([
            memberImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            memberImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            memberImageView.widthAnchor.constraint(equalToConstant: 40),
            memberImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // 멤버 이름 오토 레이아웃
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // 스택 뷰 오토 레이아웃
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: memberImageView.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: memberImageView.trailingAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: memberImageView.bottomAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    // 애드 뷰 셋업(뷰들을 화면에 추가)
    func setupAddSubView() {
        self.addSubview(memberImageView)
        self.addSubview(stackView)
    }
    
    
    // MARK: - 함수 선언
}
