//
//  SupabaseManager.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 21.01.2025.
//

import Foundation
import Supabase

class SupabaseManager {
    static let instance = SupabaseManager()
    
    let supabase = SupabaseClient(supabaseURL: URL(string: "https://cvhyzhqnpngrccwhymld.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN2aHl6aHFucG5ncmNjd2h5bWxkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ1Mzc2MzIsImV4cCI6MjA1MDExMzYzMn0.B_zabaFzJgzIvi5Y2H9rp0U5B1X1qHJyXMInDl3nRlI")
    
    func signin(email: String, password: String) async throws {
        try await supabase.auth.signIn(email: email, password: password)
    }
    
    func register(name: String, email: String, password: String) async throws {
        try await supabase.auth.signUp(email: email, password: password)
        
        let user = try await supabase.auth.user()
        
        let newUser = UserModel(
            id: user.id,
            name: name,
            email: email,
            surname: nil,
            phone: nil
        )
        
        try await supabase.from("users").insert(newUser).execute()
        
        try await supabase.auth.signOut()
    }
    
    func getProfile() async throws -> UserModel {
        let user = try await supabase.auth.session.user
        let getUser = supabase.from("users").select().eq("id", value: user.id)
        
        let response: [UserModel] = try await getUser.execute().value
        
        guard let currentuser = response.first else {
            throw URLError(.badServerResponse)
        }
        
        return currentuser
    }
    
    func signOut() async throws {
        try await SupabaseManager.instance.supabase.auth.signOut()
    }
    
    func getCategory() async throws -> [CategoryModel] {
        let getcategories = try await supabase.from("category").select().execute()
        
        let category = try JSONDecoder().decode([CategoryModel].self, from: getcategories.data)
        
        return category
    }
    
    func getSneakers() async throws -> [SneakerModel] {
        let getsneaker = try await supabase.from("sneakers").select().execute()
        
        let sneaker = try JSONDecoder().decode([SneakerModel].self, from: getsneaker.data)
        
        return sneaker
    }
    
    func getCart() async throws -> [CartModel] {
        let getcart = try await supabase.from("cart").select().execute()
        
        let cart = try JSONDecoder().decode([CartModel].self, from: getcart.data)
        
        return cart
    }
    
    func getFavorite() async throws -> [FavoriteModel] {
        let getfavorite = try await supabase.from("favorite").select().execute()
        
        let favorite = try JSONDecoder().decode([FavoriteModel].self, from: getfavorite.data)
        
        return favorite
        
    }
    
    func addFavorite(sneaker: Int) async throws {
        let user = try await supabase.auth.session.user
        
        let newFavorite = FavoriteModel(
            id: UUID(),
            id_user: user.id,
            id_sneaker: sneaker
        )
        
        try await supabase.from("favorite").insert(newFavorite).execute()
        
    }
    
    func deleteFavorite(sneaker: Int) async throws {
        let user = try await supabase.auth.session.user
        try await supabase.from("favorite").delete().eq("id_user", value: user.id).eq("id_sneaker", value: sneaker).execute()
    }
    
    func addNewItemCart(sneaker: Int) async throws {
        let user = try await supabase.auth.session.user
        let newItemInCart = CartModel(
            id: UUID(),
            id_user: user.id,
            id_sneaker: sneaker,
            count: 1
        )
        try await supabase.from("cart").insert(newItemInCart).execute()
    }
    
    func addCart(sneaker: Int, count: Int) async throws {
        let user = try await supabase.auth.session.user
        try await supabase.from("cart").update(["count" : count+1]).eq("id_user", value: user.id).eq("id_sneaker", value: sneaker).execute()
    }
    
    func deleteCart(sneaker: Int) async throws {
        let user = try await supabase.auth.session.user
        
        try await supabase.from("cart").delete().eq("id_sneaker", value: sneaker).eq("id_user", value: user.id).execute()
        
    }
    
    func addTextInSearchField(text: String) async throws {
        let user = try await supabase.auth.session.user
        
        let newSearch = SearchModel(
            id: UUID(),
            id_user: user.id,
            searchtext: text
        )
        
        try await supabase.from("searchable").insert(newSearch).execute()
    }
    
    func getSearchText() async throws -> [SearchModel] {
        let getSearchText = try await supabase.from("searchable").select().execute()
        
        let searchText = try JSONDecoder().decode([SearchModel].self, from: getSearchText.data)
        
        return searchText
    }
    
    func resetPassword(email: String) async throws {
        try await supabase.auth.resetPasswordForEmail("berkut589243@gmail.com")
    }
    
    func OTP(email: String, otp: String) async throws {
        try await supabase.auth.verifyOTP(email: email, token: otp, type: .recovery)
    }
    
    func updatePassword(password: String) async throws {
        try await supabase.auth.update(user: .init(password: password))
        
    }
    
    func updateField(name: String, surname: String, phone: String) async throws {
        let user = try await supabase.auth.session.user
        
        try await supabase.from("users").update(["name":name, "surname":surname, "phone":phone]).eq("id", value: user.id).execute()
        
    }
    
    func uploadAvatar(image: Data) async throws {
        let user = try await supabase.auth.session.user
        
        let files = try await supabase.storage.from("photos").list(path: "public")
        
        let exits: Bool = files.reduce(false) { partialResult, file in
            if partialResult {
                return true
            }
            return file.name == "\(user.id).jpg"
        }
        
        
        if exits {
            try await supabase.storage.from("photos")
                .update("public/\(user.id).jpg", data: image)
        } else {
            try await supabase.storage.from("photos")
                .upload("public/\(user.id).jpg", data: image)
        }
    }
    
    func downloadAvatar() async throws {
        
    }
    
}
