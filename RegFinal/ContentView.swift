//
//  ContentView.swift
//  RegFinal
//
//  Created by Виталий Багаутдинов on 21.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var log_status: Bool = false
    
    var body: some View {
        VStack {
            if !log_status {
                HomeView()
            } else {
                SignInView()
            }
        }.onAppear(perform: {
            let user = SupabaseManager.instance.supabase.auth.currentUser
            self.log_status = user == nil
        })
    }
}

#Preview {
    ContentView()
}
