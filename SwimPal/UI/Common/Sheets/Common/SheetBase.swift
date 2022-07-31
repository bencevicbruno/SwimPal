//
//  SheetBase.swift
//  SwimPal
//
//  Created by Bruno Benčević on 17.07.2022..
//

import SwiftUI
import Combine

struct SheetBase<Content: View>: View {
    
    @Binding var isVisible: Bool
    
    @State private var didAppear = false
    @State private var sheetHeight: CGFloat = 0
    
    @State private var dragOffset: CGFloat = 0
    @State private var initialDragPosition: CGFloat = 0
    @State private var didSetInitialDragPosition = false
    
    @State private var keyboardHeight: CGFloat = 0
    
    @ViewBuilder
    var content: (@escaping DismissWithCallback) -> Content
    
    var body: some View {
        ZStack(alignment: .bottom) {
            overlay
                .edgesIgnoringSafeArea(.top)
            
            GeometryReader { geo in
                VStack(spacing: 0) {
                    Spacer()
                    
                    SheetNotch()
                    
                    sheetContent
                        .background(Color.white)
                    
                    Spacer()
                        .frame(height: keyboardHeight)
                        .onReceive(keyboardPublisher, perform: { newKeyboardHeight in
                            withAnimation {
                                keyboardHeight = newKeyboardHeight
                            }
                        })
                }
                .offset(x: 0, y: (didAppear ? 0 : sheetHeight) + dragOffset)
                .gesture(dragGesture)
                .onAppear {
                    willAppear(height: geo.size.height)
                }
                .onDisappear {
                    dismiss()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    init(_ isVisible: Binding<Bool>, _ content: @escaping (@escaping DismissWithCallback) -> Content) {
        self._isVisible = isVisible
        self.content = content
    }
    
    var keyboardPublisher: AnyPublisher<CGFloat, Never> {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .map { notification in
                    if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                        let keyboardRectangle = keyboardFrame.cgRectValue
                        return keyboardRectangle.height
                    }
                    
                    return 0
                },
            
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in 0 }
        )
        .eraseToAnyPublisher()
    }
}

private extension SheetBase {
    
    // MARK: - UI Components
    
    var overlay: some View {
        if #available(iOS 15.0, *) {
            return Rectangle()
                .fill(Material.thin)
                .opacity(didAppear ? 1 : 0)
                .onTapGesture {
                    dismiss()
                }
                .eraseToAnyView()
        } else {
            return Rectangle()
                .fill(SheetUtils.overlayColor)
                .opacity(didAppear ? 1 : 0)
                .onTapGesture {
                    dismiss()
                }
                .eraseToAnyView()
        }
    }
    
    var sheetContent: some View {
        content(dismiss)
            .frame(maxWidth: .infinity)
            .clipped()
            .background(Color.white)
    }
    
    // MARK: - User Interaction
    
    func willAppear(height: CGFloat) {
        sheetHeight = height
        
        SheetUtils.animate {
            didAppear = true
            MainCoordinator.getInstance().isTabBarHidden.toggle()
        }
    }
    
    func dismiss(_ action: EmptyCallback? = nil) {
        guard didAppear else { return }
        
        SheetUtils.animate {
            didAppear = false
            MainCoordinator.getInstance().isTabBarHidden.toggle()
        } completion: {
            isVisible = false
            action?()
        }
    }
    
    // MARK: - Drag Gesture
    
    func shouldDismiss(dragLocation: CGPoint) -> Bool {
        abs(initialDragPosition - dragLocation.y) > (UIScreen.height - initialDragPosition) / 2
    }
    
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
            .onEnded { dragValue in
                didSetInitialDragPosition = false
                
                if shouldDismiss(dragLocation: dragValue.location) {
                    dismiss()
                } else {
                    withAnimation {
                        self.dragOffset = 0
                    }
                }
            }
    }
}

struct SheetBase_Previews: PreviewProvider {
    
    static let data = ConfirmationData(title: "Title", message: "Long message goes in here.")
    
    static var previews: some View {
        SheetBase(.constant(true)) { onDismissed in
            
            VStack(spacing: 0) {
                SheetTitle(data.title)
                    .padding(.vertical, 24)
                
                SheetDescription(data.message)
                    .padding(.bottom, 24)
                
                HStack(spacing: 24) {
                    SheetButton(data.cancelTitle, style: .secondary) {
                        onDismissed {}
                    }
                    
                    SheetButton(data.confirmTitle) {
                        onDismissed {}
                    }
                }
            }
        }
    }
}
