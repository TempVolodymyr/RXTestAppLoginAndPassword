//
//  MainViewModel.swift
//  RxTestApp
//
//  Created by anduser on 27.04.2021.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class MainViewModel {
//    var loginText: AnyObserver<String>
//    var passwordObserver: AnyObserver<String>
//
//    var loginVariable = PublishSubject<String>()
//    var loginObservable: Observable<String>!
//    var passwordVariable = BehaviourRelay<String>()
//
//    init() {
//        loginObservable = loginVariable.asObservable()
//    }
    internal var login: AnyObserver<String>
    internal var password: AnyObserver<String>
    internal var buttonDidTapped: AnyObserver<Void>
    
    private var loginPublishSubject = PublishSubject<String>()
    private var passwordSubject = PublishSubject<String>()
    private var buttonDidTappedSubject = PublishSubject<Void>()
    
    //MARK: - Public Properties
    
    public var isValidLength: Observable<Bool> {
        Observable.combineLatest(
            loginPublishSubject.asObserver().startWith("")
            passwordSubject.asObserver().startWith("")
        )
        .map { (login, password) in
            let pattern = "[A-Za-z0-9]{4,}"
            if let _ = login.range(of: pattern, options: .regularExpression),
               let _ = password.range(of: pattern, options: .regularExpression) {
                return true
            } else {
                return false
            }
        }
    }
    
    init() {
        login = loginPublishSubject.asObserver()
        password = passwordSubject.asObserver()
        buttonDidTapped = buttonDidTappedSubject.asObserver()
    }
}
