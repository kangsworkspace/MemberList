//
//  DetailViewController.swift
//  MemberList
//
//  Created by Kang on 2023/09/06.
//

import UIKit
import PhotosUI

class DetailViewController: UIViewController {
    
    // MARK: - 변수 선언
    // 멤버 데이터 사용
    var member: Member?
    
    // 디테일 뷰 사용
    private let detailView = DetailView()
    
    // 디테일 뷰 호출
    override func loadView() {
        view = detailView
    }
    
    // 커스컴 델리게이트 사용
    weak var delegate: memberDelegate?
    
    // MARK: - 뷰 디드 로드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 메인 셋업 실행
        setupMain()
        setupBottomButton()
    }
    
    // MARK: - 셋업
    // 메인 셋업
    func setupMain() {
        
        // 데이터 셋업 실행
        setupData()
        setupTapGestures()
        setupBottomButton()
    }
    
    func setupData() {
        detailView.member = member
    }
    
    func setupBottomButton() {
        let bottomButton = detailView.bottomButton
        bottomButton.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
    }
    
    // 이미지 뷰가 눌렸을 때 동작 설정
    func setupTapGestures() {
        // 제스처 생성
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        
        // 이미지 뷰에 제스처 넣기
        detailView.imageView.addGestureRecognizer(tapGesture)
        // 유저가 이미지 뷰의 제스처 사용 가능하도록 허용
        detailView.imageView.isUserInteractionEnabled = true
    }
    
    // MARK: - 함수 선언
    @objc func bottomButtonTapped() {
        
        // 새로 추가하는 경우
        if member == nil {
            let newMemberName = detailView.nameTextField.text ?? ""
            let newMemberAge = Int(detailView.ageTextField.text ?? "")
            let newMemberPhone = detailView.phoneTextField.text ?? ""
            let newMemberAddress = detailView.addressTextField.text ?? ""
            
            // 새로운 멤버 (구조체) 생성
            var newMember: Member = Member(name: newMemberName, age: newMemberAge, phone: newMemberPhone, address: newMemberAddress)
            
            newMember.memberImage = detailView.imageView.image
            
            // 델리게이트로 데이터 전달
            delegate?.addNewMember(newMember: newMember)
            
        }
        else {
            // 업데이트 하는 경우
            let memberID = Int(detailView.idTextField.text!) ?? 0
            member?.memberImage = detailView.imageView.image
            member?.name = detailView.nameTextField.text ?? ""
            member?.age = Int(detailView.ageTextField.text ?? "")
            member?.phone = detailView.phoneTextField.text ?? ""
            member?.address = detailView.addressTextField.text ?? ""
            
            // 델리게이트로 데이터 전달
            delegate?.updateMember(indexPath: memberID, member!)
        }
        // 모든 기능이 동작한 후 화면 내리기
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func touchUpImageView() {
        // 기본설정 세팅
        var configuration = PHPickerConfiguration()
        // 사진첩에서 가져올 수 있는 수
        configuration.selectionLimit = 0
        // 사진이나 동영상 선택 가능하도록
        configuration.filter = .any(of: [.images, .videos])
        
        // 위의 설정을 가지고, 피커뷰컨트롤러 생성
        let picker = PHPickerViewController(configuration: configuration)
        // 피커뷰 컨트롤러의 대리자 설정
        picker.delegate = self
        // 피커뷰 띄우기
        self.present(picker, animated: true, completion: nil)
    }

}

// MARK: - 확장
extension DetailViewController: PHPickerViewControllerDelegate {
    // 필수 구현 메서드
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 피커뷰 dismiss
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    // 이미지뷰에 표시
                    self.detailView.imageView.image = image as? UIImage
                }
            }
        } else {
            print("이미지 못 불러왔음!!!")
        }
    }
}
