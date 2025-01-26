//
//  OnboardingTests.swift
//  RegFinalTests
//
//  Created by Виталий Багаутдинов on 22.01.2025.
//

import XCTest
@testable import RegFinal

final class OnboardingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //Проверка на валидацию email
    func testEmailValidatePredicate() {
        var email = EmailValidate()
        
        XCTAssertTrue(email.EmailValidatePredicate(email: "name@domenname.ru"))
        
        
        XCTAssertFalse(email.EmailValidatePredicate(email: "NAME@domenname.ru"))
        XCTAssertFalse(email.EmailValidatePredicate(email: "NAME@12domenname.ru"))
        
    }
    
    //Проверка на срабатывание Алерта при некорректном email
    func testAlertEmailValidate() {
        let email = EmailValidate()
        
        XCTAssertFalse(email.isAlert)
        XCTAssertTrue(email.EmailValidatePredicate(email: "name@domenname.ru"))
        XCTAssertFalse(email.isAlert)
        
        XCTAssertFalse(email.isAlert)
        XCTAssertFalse(email.EmailValidatePredicate(email: "NAME@domenname.ru"))
        XCTAssertTrue(email.isAlert)
    }
    
    //Проверка на срабатывание Алерта при некорректном password на view SignIn
    func testAlertPasswordLogIn() {
        let svm = SignInViewModel()
    
        //Проверка на то, что пароль введен верно и alert не вылазит
        XCTAssertFalse(svm.isAlertPassword)
        
        _ = svm.checkSignIn(email: svm.email, password: "123456")
        
        XCTAssertFalse(svm.isAlertPassword)
        
        //Проверка на то, что пароль введен неверно и alert вылазит
        svm.isAlertPassword = false//сброс alert
        
        _ = svm.checkSignIn(email: svm.email, password: "")
        
        XCTAssertTrue(svm.isAlertPassword)
        
        //Проверка на то, что пароль введен неверно и alert вылазит
        svm.isAlertPassword = false //сброс alert
        
        XCTAssertFalse(svm.isAlertPassword)
        
        _ = svm.checkSignIn(email: svm.email, password: "12345")
        
        XCTAssertTrue(svm.isAlertPassword)
        
    }
    
    //Проверка на срабатывание Алерта при некорректном password на view Register
    func testAlertPasswordRegister() {
        let rvm = RegisterViewModel()
        
        //Проверка на то, что пароль введен верно и alert не вылазит
        XCTAssertFalse(rvm.isAlertPassword)
        
        _ = rvm.checkRegister(email: "", password: "123456", name: "")
        
        XCTAssertFalse(rvm.isAlertPassword)
        
        //Проверка на то, что пароль введен неверно и alert вылазит
        rvm.isAlertPassword = false//сброс alert
        
        XCTAssertFalse(rvm.isAlertPassword)
        
        _ = rvm.checkRegister(email: "", password: "", name: "")
        
        XCTAssertTrue(rvm.isAlertPassword)
        
        //Проверка на то, что пароль введен неверно и alert вылазит
        rvm.isAlertPassword = false//сброс alert
        
        XCTAssertFalse(rvm.isAlertPassword)
        
        _ = rvm.checkRegister(email: "", password: "", name: "12345")
        
        XCTAssertTrue(rvm.isAlertPassword)
        
    }
    
    //Тест на успешную и провальную авторизацию
    func testAuthorize() {
        let svm = SignViewModel()
        
        // Проверяем, что изначально isNavigate равно false
        XCTAssertFalse(svm.isNavigate)
        
        // Вызываем авторизацию
        let expectation1 = XCTestExpectation(description: "Авторизация успешна")
        svm.signin(email: "berkut589243@gmail.com", password: "123456")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // Проверяем состояние isNavigate через 5 секунд
            XCTAssertTrue(svm.isNavigate)
            expectation1.fulfill()
        }

        // Ожидаем выполнения ожидания
        wait(for: [expectation1], timeout: 6)

        // Сбрасываем isNavigate перед следующим тестом
        svm.isNavigate = false
        XCTAssertFalse(svm.isNavigate)

        // Пытаемся авторизоваться с неверными данными
        let expectation2 = XCTestExpectation(description: "Авторизация неуспешна")
        svm.signin(email: "QQ@Ma.12", password: "12345")

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // Проверяем состояние isNavigate через 5 секунд
            XCTAssertFalse(svm.isNavigate)
            expectation2.fulfill()
        }

        // Ожидаем выполнения ожидания
        wait(for: [expectation2], timeout: 6)
    }




    
}
