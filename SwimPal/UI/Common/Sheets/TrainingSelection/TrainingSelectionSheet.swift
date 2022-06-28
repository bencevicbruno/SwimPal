//
//  TrainingSelectionSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import SwiftUI

struct TrainingSelectionSheet: View {
    
    @Binding var isVisible: Bool
    
    @State private var sheetHeight: CGFloat = 0
    @State private var didAppear = false
    @State private var dragOffset: CGFloat = 0
    
    @State private var initialDragPosition: CGFloat = 0
    @State private var didSetInitialDragPosition = false
    
    private let data: TrainingSelectionData
    
    var body: some View {
        ZStack(alignment: .bottom) {
            overlay
                .edgesIgnoringSafeArea(.top)
            
            GeometryReader { geo in
                VStack(spacing: 0) {
                    Spacer()
                    
                    SheetNotch()
                    
                    sheetContent
                        .background(.white)
                }
                .offset(x: 0, y: (didAppear ? 0 : sheetHeight) + dragOffset)
                .gesture(
                    dragGesture
                )
                .onAppear {
                    viewWillAppear(height: geo.size.height)
                }
                .onDisappear {
                    viewWillDisappear()
                }
            }
            .frame(maxHeight: UIScreen.main.bounds.height * 3 / 4.0)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    init(_ isVisible: Binding<Bool>, data: TrainingSelectionData) {
        self._isVisible = isVisible
        self.data = data
    }
}

private extension TrainingSelectionSheet {
    
    // MARK: - UI Components
    
    var overlay: some View {
        Rectangle()
            .fill(Material.thin)
            .opacity(didAppear ? 1 : 0)
            .onTapGesture {
                viewWillDisappear()
            }
    }
    
    var sheetContent: some View {
        ScrollView(.vertical) {
            TrainingSelection(onCategorySelected: viewWillDisappear)
                .padding(.horizontal, 12)
        }
        .padding(.bottom, min(12, UIScreen.bottomUnsafePadding))
    }
    
    // MARK: - User Interaction
    
    func viewWillAppear(height: CGFloat) {
        sheetHeight = height
        
        animate(0.4) {
            didAppear = true
            MainCoordinator.getInstance().isTabBarHidden.toggle()
        }
    }
    
    func viewWillDisappear(_ category: Training.Category? = nil) {
        guard didAppear else { return }
        
        animate(0.4) {
            didAppear = false
            MainCoordinator.getInstance().isTabBarHidden.toggle()
        } completion: {
            isVisible = false
            
            if let category = category {
                data.onCategorySelected?(category)
            }
        }
    }
    
    func animate(_ duration: Double, _ body: EmptyCallback, completion: EmptyCallback? = nil) {
        withAnimation(.linear(duration: duration)) {
            body()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            completion?()
        }
    }
    
    // MARK: - Drag Gesture
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                if !didSetInitialDragPosition {
                    didSetInitialDragPosition = true
                    initialDragPosition = value.location.y
                }
                withAnimation {
                    self.dragOffset = max(value.translation.height, 0)
                }
            }
            .onEnded { value in
                didSetInitialDragPosition = false
                
                let shouldDisappear = abs(initialDragPosition - value.location.y) > (UIScreen.main.bounds.height - initialDragPosition) / 2
                
                if shouldDisappear {
                    viewWillDisappear()
                } else {
                    withAnimation {
                        self.dragOffset = 0
                    }
                }
            }
    }
}

struct TrainingSelectionSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            TrainingSelectionSheet(.constant(true), data: .init())
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
