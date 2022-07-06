//
//  ContentView.swift
//  iExpense
//
//  Created by Landon Cayia on 6/30/22.
//

import SwiftUI

struct ContentView: View {
    // @StateObject tells SwiftUI to watch the object for any change announcements
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    let expenseTypes = ["Personal", "Business"]
    
    var currencyFormat: FloatingPointFormatStyle<Double>.Currency {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
    
    var personalExpenses: Expenses {
        let temp = Expenses()
        temp.items = expenses.items.filter { $0.type == "Personal" }
        return temp
    }
    
    var businessExpenses: Expenses {
        let temp = Expenses()
        temp.items = expenses.items.filter { $0.type == "Business" }
        return temp
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenseTypes, id: \.self) { expenseType in
                    // Don't need id because ExpenseItem comforms to Identifiable
                    Section(header: Text(expenseType)) {
                        ForEach(expenses.items.filter { $0.type == expenseType } ) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: currencyFormat)
                                    .foregroundColor(item.color)
                            }
                        }
                        .onDelete { idx in
                            let idsToDelete = idx.map {  }
                        }
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems (at offsets: IndexSet) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
