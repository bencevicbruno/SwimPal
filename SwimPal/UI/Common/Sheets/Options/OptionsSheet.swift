//
//  OptionsSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.06.2022..
//

import SwiftUI

struct OptionsSheet: View {
    
    @Binding var isVisible: Bool
    
    @State private var sheetHeight: CGFloat = 0
    @State private var didAppear = false
    @State private var dragOffset: CGFloat = 0
    
    @State private var initialDragPosition: CGFloat = 0
    @State private var didSetInitialDragPosition = false
    
    private let data: OptionsData
    
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
    
    init(_ isVisible: Binding<Bool>, data: OptionsData) {
        self._isVisible = isVisible
        self.data = data
    }
}

private extension OptionsSheet {
    
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
        VStack(alignment: .leading, spacing: 0) {
            Text(data.title)
                .fontWeight(.bold)
                .foregroundColor(.brand)
                .padding(.vertical, 24)
                .padding(.horizontal, 12)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(0..<data.options.count, id: \.self) { index in
                        optionCell(for: index)
                    }
                }
            }
            .frame(maxHeight: min(idealHeight, UIScreen.main.bounds.height * 3.0 / 4.0))
            .padding(.bottom, max(12, UIScreen.bottomUnsafePadding))
        }
        .background(Color.white)
        .multilineTextAlignment(.center)
    }
    
    var idealHeight: CGFloat {
        let rowHeight = 60 + 12
        return CGFloat(data.options.count * rowHeight)
    }
    
    func optionCell(for index: Int) -> some View {
        HStack {
            Text(verbatim: data.options[index])
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
            
            Spacer(minLength: 8)
        }
        .padding(.vertical, 20)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(index != 0 ? Color.brand : Color.brangLight)
        )
        .onTapGesture {
            viewWillDisappear(selectedIndex: index)
        }
        .padding(.horizontal, 12)
    }
    
    // MARK: - User Interaction
    
    func viewWillAppear(height: CGFloat) {
        sheetHeight = height
        
        animate(0.4) {
            didAppear = true
            MainCoordinator.getInstance().isTabBarHidden.toggle()
        }
    }
    
    func viewWillDisappear(selectedIndex: Int = -1) {
        guard didAppear else { return }
        
        animate(0.4) {
            didAppear = false
            MainCoordinator.getInstance().isTabBarHidden.toggle()
        } completion: {
            isVisible = false
            
            if selectedIndex > -1 {
                data.action?(selectedIndex)
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

struct OptionsSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            OptionsSheet(.constant(true), data: .init(title: "Choose Language", options: ["Croatian", "german", "english", "Croatian", "german", "english", "Croatian", "german", "english", "Croatian", "german", "english"]))
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
