//
//  DetailView.swift
//  MemberList
//
//  Created by Kang on 2023/09/06.
//

import UIKit

class DetailView: UIView {
    
    // MARK: - 변수 선언
    var member: Member? {
        // 멤버 내의 속성이 변하면 -> 할당을 실행
        didSet {
            // 멤버 속성이 없다면(새로 추가하는 경우)
            guard var member = member else {
                imageView.image = UIImage(systemName: "person")
                // 멤버가 없는 경우 Member의 Static 변수의 값(항상 존재) 사용
                idTextField.text = "\(Member.memberCnt)"
                nameTextField.text = ""
                phoneTextField.text = ""
                addressTextField.text = ""
                ageTextField.text = ""
                bottomButton.setTitle("UPDATE", for: .normal)
                return
            }
            // 멤버 속성이 있는 경우(수정 및 확인하는 경우)
            imageView.image = member.memberImage
            idTextField.text = "\(member.memberID)"
            nameTextField.text = member.name
            phoneTextField.text = member.phone
            addressTextField.text = member.address
            
            // 옵셔널 언래핑
            ageTextField.text = member.age != nil ? "\(member.age!)" : ""
        }
    }
    
    // 멤버 이미지 뷰
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 75
        iv.backgroundColor = .lightGray
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // 이미지 컨테이너 뷰
    lazy var imageContainerView: UIView = {
        let view = UIView()
        view.addSubview(imageView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // 멤버 ID 레이블
    var idLabel: UILabel = {
        let label = UILabel()
        label.text = "멤버번호"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 멤버 이름 레이블
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이    름"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 멤버 나이 레이블
    var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "나    이"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 멤버 전화번호 레이블
    var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "전화번호"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 멤버 주소 레이블
    var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "주    소"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 멤버 ID 텍스트 필드
    var idTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        // tf.font = UIFont.systemFont(ofSize: 16)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    // 멤버 이름 텍스트 필드
    var nameTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    // 멤버 나이 텍스트 필드
    var ageTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    // 멤버 전화번호 텍스트 필드
    var phoneTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    // 멤버 주소 텍스트 필드
    var addressTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    // 멤버 ID 스택뷰
    lazy var idStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [idLabel, idTextField])
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // 멤버 이름 스택뷰
    lazy var nameStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // 멤버 나이 스택뷰
    lazy var ageStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [ageLabel, ageTextField])
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // 멤버 전화번호 스택뷰
    lazy var phoneStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [phoneLabel, phoneTextField])
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // 멤버 주소 스택뷰
    lazy var addressStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [addressLabel, addressTextField])
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // 메인 스택뷰
    lazy var mainStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [imageContainerView, idStackView, nameStackView, ageStackView, phoneStackView, addressStackView, bottomButton])
        sv.axis = .vertical
        sv.spacing = 10
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // 하단 버튼
    var bottomButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemBlue
        button.setTitle("UPDATE", for: .normal)
        button.frame.size.height = 40
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 레이블 넓이 저장을 위한 속성
    let labelWidth: CGFloat = 70
    
    // 상단 높이 설정
    var stackViewTopConstraint: NSLayoutConstraint!
    
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 메인 셋업 실행
        setupMain()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 오토 레이아웃 셋업 실행
    override func updateConstraints() {
        setupAutoLayout()
        super.updateConstraints()
    }
    
    // 다른 곳 터치 시 창 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveDownAction()
        self.endEditing(true)
    }
    
    // MARK: - 셋업
    // 메인 셋업
    func setupMain() {
        
        // 백그라운드 컬러 설정
        self.backgroundColor = .white
        
        // 텍스트 필드 델리게이트 셋업
        setupTextFiedDelegate()
        // 애드 뷰 셋업 실행
        setupAddView()
        // 노티피케이션 설정
        setupNotification()
    }
    
    // 텍스트 필드 델리게이트 셋업
    func setupTextFiedDelegate() {
        idTextField.delegate = self
    }
    
    // 애드 뷰 셋업
    func setupAddView() {
        addSubview(mainStackView)
    }
    
    // 오토 레이아웃 셋업
    func setupAutoLayout() {
        // 상단 세팅
        stackViewTopConstraint = mainStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
        
        // 이미지 컨테이너 레이아웃
        NSLayoutConstraint.activate([
            imageContainerView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        // 이미지 뷰 레이아웃
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor, constant: 0),
            imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor, constant: 0)
        ])
        
        // 버튼 레이아웃
        NSLayoutConstraint.activate([
            bottomButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // 메인 스택뷰 레이아웃
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackViewTopConstraint
        ])
        
        // 기타 레이블 레이아웃(ID, Name, Age, Phone, Address)
        NSLayoutConstraint.activate([
            idLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            nameLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            ageLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            phoneLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            addressLabel.widthAnchor.constraint(equalToConstant: labelWidth)
        ])
    }
    
    // 노티피케이션 설정
    func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(moveUpAction), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    // 노티피케이션 - 키보드가 사라졌을 때의 설정
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    // MARK: - 함수 선언
    @objc func moveUpAction() {
        stackViewTopConstraint.constant = -30
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    func moveDownAction() {
        stackViewTopConstraint.constant = 10
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
}
// MARK: - 확장
// 텍스트 필드 델리게이트 구현
extension DetailView: UITextFieldDelegate {
    // 텍스트 필드에서 입력을 감지할 때 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     
        // 멤버 아이디는 수정 못하도록 설정 (멤버 아이디의 텍스트 필드는 입력 안되도록 설정
        if textField == idTextField {
            return false
        }
        
        return true
    }
}
