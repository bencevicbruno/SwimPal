//
//  NewDialogSheetBase.swift
//  SwimPal
//
//  Created by Bruno Bencevic on 03.11.2022..
//

import SwiftUI

struct NewDialogSheetBase<Dialog, Content>: View where Dialog: SheetDialog, Content: View {
    
    @Binding var isVisible: Bool
    private let dialog: Dialog
    @ViewBuilder private let contentBuilder: (_ dismiss: @escaping Callback<EmptyCallback>) -> Content
    
    init(isVisible: Binding<Bool>, dialog: Dialog, content: @escaping (_ dismiss: @escaping Callback<EmptyCallback>) -> Content) {
        self.dialog = dialog
        self._isVisible = isVisible
        self.contentBuilder = content
    }
    
    @State private var didAppear = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            BlurredView(style: .light)
                .isVisible(didAppear)
                .onTapGesture {
                    onOverlayTapped()
                }
            
            if didAppear {
                contentBuilder(dismiss)
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                didAppear = true
                MainCoordinator.getInstance().isTabBarHidden.toggle()
            }
        }
    }
}

private extension NewDialogSheetBase {
    
    func onOverlayTapped() {
        guard dialog.dismissOnOverlayTap else { return }
        
        dismiss {
            dialog.dismissAction?()
        }
    }
    
    func dismiss(_ actionAfterDismiss: EmptyCallback? = nil) {
        withAnimation(.easeOut(duration: 0.3)) {
            didAppear = false
            MainCoordinator.getInstance().isTabBarHidden.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isVisible = false
            actionAfterDismiss?()
        }
    }
}

struct NewDialogSheetBase_Previews: PreviewProvider {
    
    static var previews: some View {
        NewDialogSheetBase(isVisible: .constant(true), dialog: ConfirmationDialog.previewExample) { dismiss in
            Text("hihi")
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("image_trainingCategory_endurance")
                    .resizable()
                    .scaledToFill()
            )
            .edgesIgnoringSafeArea(.all)
    }
}
