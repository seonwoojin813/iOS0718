//
//  ViewController.swift
//  gestureevent0718
//
//  Created by Woojin on 18/07/2019.
//  Copyright © 2019 Woojin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    //이미지 파일 이름을 가진 배열 생성
    var imageNames = ["Ronaldo.jpeg", "messi.jpeg"]
    //몇 번쩨 이미지가 출력 중인지를 저장할 속성
    var idx : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //Ronaldo.jpeg 파일의 내용을 이미지 뷰에 출력
            imageView.image = UIImage(named: "Ronaldo.jpeg")
       
        //Tab Gesture 객체 생성
        let tap = UITapGestureRecognizer(target:self,
                                         action:#selector(tapMethod))
        //tap option 설정
        tap.numberOfTapsRequired = 2
        //tap.numberOfTouchesRequired = 터치개수
        //View 에 Gesture 객체 연결
        imageView.addGestureRecognizer(tap)
        
        //회전이 발생했을 떄 메소드를 호출하도록 설정
        NotificationCenter.default.addObserver(forName:UIDevice.orientationDidChangeNotification, object: nil, queue: .main, using:didRotate)
        //notification을 해제할 때는 addOvsever 대신 removeObserver를 호출
        
    }
    
    //제스쳐가 호출할 메소드
    @objc func tapMethod (sender:UITapGestureRecognizer){
        //idx를 이용해서 imageNames 배열에 있는 그림 파일 이름을 변경
        idx = idx + 1
        imageView.image = UIImage(named: imageNames[idx % 2])
        
    }
    
    
    //현재 뷰 컨트롤러가 회전을 지원하도록 연산 프로퍼티를 설정
    override var shouldAutorotate: Bool{
        return true
    }
    
    //현재 뷰 컨트롤러의 회전 가능 방향을 설정하는 연산 프로퍼티를 오버라이딩
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        //열거형 상수의 이름이 소문자로 변경이 되었고
        //열거형 상수를 사용할 때 자료형이 생략가능
        return [.all]
    }
    
    //뷰 컨트롤러에서 뷰의 크기가 변경된 경우 호출되는 메소드 오버라이딩
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape{
            print("가로로 회전 - ViewController")
        }else{
        print("세로로 회전 - ViewController")
    }
        
   }
    
    //클로저를 이용해서 메소드를 만들고 변수에 저장해서 메소드처럼 사용
    var didRotate:(Notification) -> Void = {notification in switch UIDevice.current.orientation{
    case .landscapeLeft, .landscapeRight:
    print("알림 - 가로 방향")
    case .portrait, .portraitUpsideDown:
    print("알림 - 세로 방향")
    default :
    print("방향을 알 수 없음")
    }
    }
    
    func didRotateEX(notification:Notification){
        
    }
}

