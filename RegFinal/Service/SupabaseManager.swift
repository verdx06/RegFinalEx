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
            email: email
        )
        
        try await supabase.from("users").insert(newUser).execute()
        
        try await supabase.auth.signOut()
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
    
}
