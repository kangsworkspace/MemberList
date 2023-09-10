# MemberList

## 🖥️ 프로젝트 소개

- TableView와 TableViewCell을 활용하여 프로필 리스트 기능을 구현하였습니다.
- TableViewCell을 클릭하면 더 자세한 정보를 확인할 수 있습니다.
- 더 자세한 정보를 보는 창에서 정보 및 프로필 이미지를 수정할 수 있습니다.
- +버튼을 눌러 새로운 프로필을 등록할 수 있습니다.


<br>

## 👀 프로젝트 구성 및 기능

- 총 두개의 페이지로 구성되어 있습니다.(프로필 목록 페이지, 자세한 정보 확인 페이지)
- 프로필 목록 페이지는 목록을 보여주는 TableView, 새로운 목록을 추가하는 +버튼이 있습니다.
![첫 화면](https://github.com/kangsworkspace/DataStorage/assets/141600830/6acccf13-f50d-4a6e-84a6-a7c110eeef5f)
![추가 화면](https://github.com/kangsworkspace/DataStorage/assets/141600830/489ff97d-2126-4a05-ab1c-2ffbee22c8ec)

- 자세한 정보를 확인하는 페이지는 목록의 정보를 확인, 수정이 가능합니다.
![자세한 정보 페이지](https://github.com/kangsworkspace/DataStorage/assets/141600830/f243d98c-c396-4293-b58d-07285cc77169)


<br>

## 📌 학습한 주요 내용

#### 피커뷰를 통한 앨범 확인 및 선택 기능
이미지 뷰에 `UITapGestureRecognizer`를 설정하여 이미지 뷰를 터치 가능하게 하였고
`PHPickerViewControllerDelegate` 확장 및 `PHPickerViewController()` 설정으로 피커뷰를 사용하였습니다.


#### Custom Delegate
리스트 추가와 리스트 수정의 기능을 하는 두가지 함수를 가진 커스텀 델리게이트를 선언하였습니다.
커스텀 델리게이트를 이용하여 자세한 정보 확인 페이지에서 데이터를 전달할 때의 코드가 간략해졌습니다.


#### Notification
키보드가 올라오는 시점에 오토 레이아웃의 설정을 바꾸는 기능을 추가하기 위해 해당 시점을 노티피케이션으로 파악하였습니다.


## 🎬 완성된 모습
![1](https://github.com/kangsworkspace/DataStorage/assets/141600830/89d14890-a157-4634-a2c2-303ab07fe192)
![2](https://github.com/kangsworkspace/DataStorage/assets/141600830/487e34ab-8f2d-45d1-9a61-2700b26929ec)
![3](https://github.com/kangsworkspace/DataStorage/assets/141600830/75237334-4cf5-4bf5-94a0-7928679cf455)
![4](https://github.com/kangsworkspace/DataStorage/assets/141600830/7c82295d-7f4a-46da-aeb2-575726078e41)
![5](https://github.com/kangsworkspace/DataStorage/assets/141600830/9a0baa6d-26b1-4fe1-b592-206699130723)


## 🙉 문제점 및 해결

var, lazy var, let 등 변수를 어떤 저장 변수로 설정할 지에 대한 정확한 이해가 부족하였습니다.
실제로 + 버튼을 추가하는 아래의 코드에서 에러가 발생하였습니다.
```swift
var plusButton: UIBarButtonItem = {
let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
return button
}()
```
에러가 발생한 이유는 +버튼을 클로저를 통해 초기화 하는데 `self`를 사용하면 +버튼 인스턴스가 완전히 초기화되기 전에 참조되었기 때문입니다.
비슷한 유형의 에러를 여러번 수정한 이후 해당 `self`키워드나 다른 변수를 참조하는 경우에 더 신경써서 작업을 하게 되었습니다. 
