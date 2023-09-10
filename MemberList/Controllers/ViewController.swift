//
//  ViewController.swift
//  MemberList
//
//  Created by Kang on 2023/09/06.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 변수 선언
    // 멤버 리스트 매니저 사용
    var memberListManger = MemberListManager()
    
    // 테이블 뷰 사용
    private let tableView = UITableView()
    
    // 네비게이션 바 버튼 추가
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()
    
    // MARK: - 뷰 디드 로드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 메인 셋업
        setMain()
    }
    
    // 오토 레이아웃 정하는 정확한 시점
    override func updateViewConstraints() {
        // 테이블 뷰 오토 레이아웃
        setTableViewAutoLayout()
        super.updateViewConstraints()
    }
    
    
    // MARK: - 셋업
    // 메인 셋업
    func setMain() {
        setupData()
        setupTableView()
        setupNavigationBar()
    }
    
    // 데이터 뷰 셋업
    func setupData() {
        memberListManger.makeMemberList()
    }
    
    
    // 테이블 뷰 셋업
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        // 셀의 높이 설정
        tableView.rowHeight = 60
        
        // 셀의 등록
        tableView.register(MemberTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    // 네비게이션 바 셋업
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // 불투명
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // 네비게이션 바 오른쪽 상단 버튼 설정
        self.navigationItem.rightBarButtonItem = self.plusButton
    }
    
    // 테이블 뷰 오토 레이아웃 설정
    func setTableViewAutoLayout() {
        
        // 뷰에 테이블 뷰 추가
        view.addSubview(tableView)
        
        // 오토 레이아웃 설정
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    
    // MARK: - 함수 선언
    // 플러스 버튼 동작
    @objc func plusButtonTapped() {
        
        // 화면 이동
        let detailVC = DetailViewController()
        detailVC.delegate = self
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

// MARK: - 확장
// 테이블 뷰 데이터 소스
extension ViewController: UITableViewDataSource {
    // 1) 테이블뷰에 몇개의 데이터를 표시할 것인지(셀이 몇개인지)를 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManger.memberList.count
    }
    
    // 2) 셀의 구성(셀에 표시하고자 하는 데이터 표시)을 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MemberTableViewCell
        
        cell.member = memberListManger.getMemberList()[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}

// 테이블 뷰 델리게이트 패턴
extension ViewController: UITableViewDelegate {
    
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 이동
        let detailVC = DetailViewController()
        detailVC.delegate = self
        
        detailVC.member = memberListManger.getMemberList()[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// 커스텀 델리게이트 사용
extension ViewController: memberDelegate {
    func addNewMember(newMember: Member) {
        memberListManger.memberListAdd(newMember)
        tableView.reloadData()
    }
    
    func updateMember(indexPath: Int, _ member: Member) {
        memberListManger.memberListUpdate(indexPath, member)
        tableView.reloadData()
    }
}
