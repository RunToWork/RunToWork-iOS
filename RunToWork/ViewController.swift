//
//  ViewController.swift
//  RunToWork
//
//  Created by eunae on 2022/11/16.
//

import UIKit
import AuthenticationServices

import SnapKit
import KakaoSDKAuth

class ViewController: UIViewController {
    
    private lazy var idView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 3
        return view
    }()
    
    private lazy var idTextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        return textField
    }()
    
    private lazy var passwordView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 3
        return view
    }()
    
    private lazy var passwordTextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    private lazy var loginButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 3
        return button
    }()
    
    private lazy var findStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var findIdButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    
    private lazy var verticalBar = {
        let label = UILabel()
        label.text = "|"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var findPasswordButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    
    private lazy var kakaoLoginButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "kakao"), for: .normal)
        button.setTitle("Kakao로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.cornerRadius = 3
        button.backgroundColor = UIColor(named: "kakaoBackground")
        return button
    }()
    
    private lazy var appleLoginButton = {
        let button = ASAuthorizationAppleIDButton(
            authorizationButtonType: .signIn,
            authorizationButtonStyle: .whiteOutline)
        return button
    }()
    
    private lazy var signupButton = {
        let button = UIButton()
        button.setTitle(" 회원가입 ", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigation()
        self.setupSubviews()
    }
    
    func setupNavigation() {
        self.navigationItem.title = "로그인"
    }

    func setupSubviews() {
        view.addSubview(idView)
        idView.addSubview(idTextField)
        view.addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(findStackView)
        findStackView.addArrangedSubview(findIdButton)
        findStackView.addArrangedSubview(verticalBar)
        findStackView.addArrangedSubview(findPasswordButton)
        view.addSubview(kakaoLoginButton)
        view.addSubview(appleLoginButton)
        view.addSubview(signupButton)
        
        idView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        idTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
        }
        
        passwordView.snp.makeConstraints {
            $0.top.equalTo(idView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }

        passwordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        findStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(14)
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(findStackView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        
        signupButton.snp.makeConstraints {
            $0.top.equalTo(appleLoginButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }
    }
}

