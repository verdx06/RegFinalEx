//
//  ProfileView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 04.02.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @State var text: String = ""
    
    @State var isBarCode: Bool = false
    @StateObject var barcodevm = BarCodeViewModel()
    
    @StateObject var profilevm = ProfileViewModel()
    @State var edit: Bool = false
    
    @State var isShown: Bool = false
    @State var isShownGalary: Bool = false
    @State var actionSheet: Bool = false
    
    @State private var avatar: UIImage? = UIImage(named: "default")
    
    var body: some View {
            ZStack {
                VStack() {
                    HStack {
                        if !edit {
                            Image("Hamburger")
                            Spacer()
                            ZStack {
                                Text("Профиль")
                            }
                            Spacer()
                            Button {
                                edit.toggle()
                            } label: {
                                Image("redactor")
                            }
                        } else {
                            Button {
                                edit.toggle()
                                profilevm.updateFields()
                            } label: {
                                Image("buttonSave")
                            }
                            
                        }
                        
                    }
                    Button {
                        actionSheet = true
                    } label: {
                        if let avatar = avatar {
                            Image(uiImage: avatar)
                                .resizable()
                                .frame(width: 96)
                                .frame(height: 90)
                                .padding(.top, 45)
                        }
                    }
                    HStack {
                        Text(profilevm.user?.name ?? "")
                        Text(profilevm.user?.surname ?? "")
                    }
                    
                    Button {
                        barcodevm.lookBarCode()
                        isBarCode = true
                    } label: {
                        Image("barcodeimage")
                    }
                    
                    let name = profilevm.user?.name
                    EditField(title: "Имя", element: name ?? "", text: $profilevm.name, edit: edit)
                    let surname = profilevm.user?.surname
                    EditField(title: "Фамилия", element: surname ?? "", text: $profilevm.surname, edit: edit)
                    let phone = profilevm.user?.phone
                    EditField(title: "Телефон", element: phone ?? "", text: $profilevm.phone, edit: edit)
                    
                    
                    Spacer()
                }
                    .padding(.horizontal)
                if isBarCode {
                    Button  {
                        barcodevm.returnBrightness()
                        isBarCode = false
                    } label: {
                        BarCodeView()
                    }
                }
            }
            .onChange(of: avatar!, { oldValue, newValue in
                profilevm.uploadPhoto(image: newValue)
            })
            .sheet(isPresented: $isShownGalary, content: {
                ImagePicker(avatarImage: $avatar, sourceType: .camera)
            })
            .sheet(isPresented: $isShown, content: {
                ImagePicker(avatarImage: $avatar, sourceType: .photoLibrary)
            })
            .navigationBarBackButtonHidden()
            
            .actionSheet(isPresented: $actionSheet) {
            ActionSheet(
                title: Text("Выберите действие"),
                buttons: [
                    .default(Text("Камера")) {
                        self.isShownGalary = true
                    },
                    .default(Text("Галерея фото")) {
                        self.isShown = true
                    },
                    .cancel(Text("Отмена")) // Кнопка отмены
                ]
            )
        }
    }
}
