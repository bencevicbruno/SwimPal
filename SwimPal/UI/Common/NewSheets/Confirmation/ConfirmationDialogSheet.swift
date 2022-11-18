//
//  ConfirmationDialogSheet.swift
//  SwimPal
//
//  Created by Bruno Bencevic on 02.11.2022..
//

import SwiftUI

struct ConfirmationDialogSheet: View {
    
    @Binding var isVisible: Bool
    private let dialog: ConfirmationDialog
    
    init(dialog: ConfirmationDialog, isVisible: Binding<Bool>) {
        self.dialog = dialog
        self._isVisible = isVisible
    }
    
    @State private var didAppear = false
    @State private var contentSize: CGSize = .zero
    
    var body: some View {
        NewDialogSheetBase(isVisible: $isVisible, dialog: dialog) { dismiss in
            VStack(spacing: 0) {
                VStack(spacing: 12) {
                    Text("Title")
                        .style(.roboto(.headline1, .bold), .black, .center)
                    
                    Text(dialog.message)
                        .style(.roboto(.body, .regular), .black, .center)
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity)
                .background(
                    BlurredView(style: .light)
                        .opacity(0.5)
                )
                
                HStack(spacing: 2) {
                    Text(dialog.declineTitle)
                        .style(.roboto(.body, .bold), .black, .center)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            BlurredView(style: .light)
                                .opacity(0.5)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            dismiss {
                                dialog.confirmAction()
                            }
                        }
                    
                    Text(dialog.confirmTitle)
                        .style(.roboto(.body, .bold), .black, .center)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            BlurredView(style: .light)
                                .opacity(0.5)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            dismiss {
                                dialog.declineAction?()
                            }
                        }
                }
                .background(
                    BlurredView(style: .light)
                        .opacity(0.5)
                )
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .dropShadow(.black.opacity(0.1))
            .padding(.horizontal, 12)
            .padding(.bottom, max(UIScreen.bottomUnsafePadding, 12))
        }
    }
}

struct ConfirmationDialogSheet_Previews: PreviewProvider {
    
    static var previews: some View {
        ConfirmationDialogSheet(dialog: .previewExample, isVisible: .constant(true))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("image_trainingCategory_endurance")
                    .resizable()
                    .scaledToFill()
            )
            .edgesIgnoringSafeArea(.all)
    }
}
