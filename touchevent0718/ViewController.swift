//
//  ViewController.swift
//  touchevent0718
//
//  Created by Woojin on 18/07/2019.
//  Copyright © 2019 Woojin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //터치가 시작될 때 호출되는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //터치가 발생한 뷰를 확인
        //Set이나 Dict 등에서 데이터를 가져오면 없을 수 도 있어서
        //Optional 타입 입니다.
        let touch = touches.first
        if touch!.view == imageView{
            //터치가 발생한 좌표
            let pt = touch!.location(in: view)
            //좌표를 출력
            label.text = "x:\(pt.x) y\(pt.y)"
        }
    }
    
    //터치가 움직일 떄 이미지 뷰가 따라 다니도록 만들기
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        //이미지 뷰에서 터치가 발생하면 이미지 뷰의 중앙점을 발생한 좌표로 설정
        if touch!.view == imageView{
            //imageView.center = touch!.location(in: view)
            
            //frame을 가지고 왼쪽 상단 좌표 를 변경
            imageView.frame.origin = touch!.location(in: view)
        }
    }

}

