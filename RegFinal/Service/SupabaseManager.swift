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
    
}
