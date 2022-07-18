//
//  AddExerciseView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 13.07.2022..
//

import SwiftUI

struct AddExerciseView: View {
    
    @ObservedObject var viewModel: AddExerciseViewModel
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                content
                    .padding(.horizontal, 10)
            }
            .padding(.top, NavigationBar.height)
            .padding(.bottom, BigBottomButton.totalHeight)
            
            VStack(spacing: 0) {
                NavigationBar("Add Exercise", onXTapped: viewModel.dismiss)
                    .addShadow()
                
                Spacer()
                
                BigBottomButton("Add exercise", onTapped: viewModel.dismiss)
                    .addShadow()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .removeNavigationBar()
        .optionsSheet($viewModel.optionsData)
        .timePickerSheet($viewModel.timePickerData)
        .valuePickerSheet($viewModel.valuePickerData)
    }
}

private extension AddExerciseView {
    
    var content: some View {
        VStack(spacing: 10) {
            exerciseTypeCard
                .padding(.top, 20)
            
            exerciseValueCard
            
            separator
            
            repetitions
            
            timeLimit
            
            Spacer()
        }
    }
    
    var exerciseTypeCard: some View {
        NamedContainer("Exercise") {
            HStack(spacing: 10) {
                if let exerciseStyle = viewModel.exerciseStyle {
                    Text(exerciseStyle.title)
                        .style(.roboto(.body), .black)
                } else {
                    Text("Select an exercise")
                        .style(.roboto(.body), .black)
                }
                
                Spacer(minLength: 10)
                
                Image(systemName: "chevron.down")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.brand)
                    .frame(24)
                    .frame(40)
            }
            .padding(.leading, 10)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            viewModel.exerciseStyleTapped()
        }
    }
    
    var exerciseValueCard: some View {
        NamedContainer(viewModel.exerciseStyle?.valueTitle ?? "Amount", color: conditionalColor) {
            HStack(spacing: 10) {
                Text("01:00h")
                    .style(.roboto(.body), .black)
                
                Spacer(minLength: 10)
                
                Text("Change")
                    .style(.roboto(.caption), .brand)
                    .frame(height: 40)
            }
            .padding(.leading, 10)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            viewModel.valueCardTapped()
        }
    }
    
    var separator: some View {
        HStack(spacing: 5) {
            Capsule()
                .fill(Color.gray142)
                .frame(width: 20, height: 5)
            
            Text("Optional")
                .style(.roboto(.body, .bold), .gray142)
            
            Capsule()
                .fill(Color.gray142)
                .frame(height: 5)
        }
    }
    
    var repetitions: some View {
        NamedContainer("Repetitions", color: conditionalColor) {
            Picker("Repetitions", selection: $viewModel.repetitions) {
                ForEach(viewModel.availableRepetitions, id: \.self) { index in
                    HStack(spacing: 0) {
                        Text("\(index)")
                            .style(.roboto(.body, .bold))
                        
                        Spacer(minLength: 0)
                            .frame(width: UIScreen.width - 100)
                    }
                }
            }
            .allowsHitTesting(condition)
            .frame(width: UIScreen.width - 50)
            .pickerStyle(.wheel)
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .clipped()
            .clipShape(.roundedRectangle(10))
        }
        .frame(maxWidth: 100)
    }
    
    var timeLimit: some View {
        NamedContainer("Time Limit", color: conditionalColor) {
            HStack(spacing: 0) {
                Text(viewModel.timeLimit?.getFormatted(with: .minutesSeconds) ?? "No Limit")
                    .frame(height: 40)
                
                Spacer(minLength: 10)
            }
            .padding(.leading, 10)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            guard condition else { return }
            viewModel.timeLimitTapped()
        }
    }
    
    var condition: Bool {
        viewModel.exerciseStyle != nil
    }
    
    var conditionalColor: UIColor {
        condition ? .brand : .gray142
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView(viewModel: .init())
    }
}
