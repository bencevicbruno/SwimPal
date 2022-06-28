//
//  ConfirmationSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 15.06.2022..
//

import SwiftUI

struct ConfirmationSheet: View {
    
    @Binding var isVisible: Bool
    
    @State private var sheetHeight: CGFloat = 0
    @State private var didAppear = false
    @State private var dragOffset: CGFloat = 0
    
    @State private var initialDragPosition: CGFloat = 0
    @State private var didSetInitialDragPosition = false
    
    private let data: ConfirmationData
    
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
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    init(_ isVisible: Binding<Bool>, data: ConfirmationData) {
        self._isVisible = isVisible
        self.data = data
    }
}

private extension ConfirmationSheet {
    
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
        VStack(spacing: 0) {
            Text(data.title)
                .fontWeight(.bold)
                .foregroundColor(.brand)
                .padding(.vertical, 24)
            
            Text(data.message)
                .fontWeight(.regular)
                .foregroundColor(.black)
                .padding(.bottom, 24)
            
            HStack(spacing: 24) {
                cancelButton
                
                confirmButton
            }
        }
        .padding(.horizontal, 12)
        .padding(.bottom, max(12, UIScreen.bottomUnsafePadding))
        .background(Color.white)
        .multilineTextAlignment(.center)
    }
    
    var cancelButton: some View {
        Text(data.cancelTitle.uppercased())
            .fontWeight(.bold)
            .foregroundColor(.black)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray242)
            )
            .onTapGesture {
                viewWillDisappear()
            }
    }
    
    var confirmButton: some View {
        Text(data.confirmTitle.uppercased())
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(height: 60)
            .frame(maxWidth: .infinity).background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.brand)
            )
            .onTapGesture {
                viewWillDisappear(performAction: true)
            }
    }
    
    // MARK: - User Interaction
    
    func viewWillAppear(height: CGFloat) {
        sheetHeight = height
        
        animate(0.4) {
            didAppear = true
            MainCoordinator.getInstance().isTabBarHidden.toggle()
        }
    }
    
    func viewWillDisappear(performAction: Bool = false) {
        guard didAppear else { return }
        
        animate(0.4) {
            didAppear = false
            MainCoordinator.getInstance().isTabBarHidden.toggle()
        } completion: {
            isVisible = false
            
            if performAction {
                data.action?()
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

struct ConfirmationSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            ConfirmationSheet(.constant(true), data: .init(title: "Delete all data?", message: "Changes can't be undone if you delete all your data."))
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
