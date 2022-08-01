//
//  Localizable.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import Foundation

enum Localizable {
    
    static var onboarding_title_first: String { "onboarding_title_first".localized() }
    static var onboarding_title_second: String { "onboarding_title_second".localized() }
    static var onboarding_title_third: String { "onboarding_title_third".localized() }
    static var onboarding_message_first: String { "onboarding_message_first".localized() }
    static var onboarding_message_second: String { "onboarding_message_second".localized() }
    static var onboarding_message_third: String { "onboarding_message_third".localized() }
    
    static var continue_with_google: String { "continue_with_google".localized() }
    static var welcome_to: String { "welcome_to".localized() }
    static var not_available_abbr: String { "not_available_abbr".localized() }
    static var login: String { "login".localized() }
    static var register: String { "register".localized() }
    static var email: String { "email".localized() }
    static var password: String { "password".localized() }
    static var repeat_password: String { "repeat_password".localized() }
    static var register_msg: String { "register_msg".localized() }
    static var cancel: String { "cancel".localized() }
    static var confirm: String { "confirm".localized() }
    static var ok: String { "ok".localized() }
    static var retry: String { "retry".localized() }
    static var log_out: String { "log_out".localized() }
    static var log_out_msg: String { "log_out_msg".localized() }
    static var next: String { "next".localized() }
    static var start_swimming: String { "start_swimming".localized() }
    static var about: String { "about".localized() }
    
    static var training: String { "training".localized() }
    static var trainings: String { "trainings".localized() }
    static var training_category_lifeguard: String { "training_category_lifeguard".localized() }
    static var training_category_everything4x: String { "training_category_everything4x".localized() }
    static var training_category_endurance: String { "training_category_endurance".localized() }
    static var training_category_tooFastForYou: String { "training_category_tooFastForYou".localized() }
    static var training_category_random: String { "training_category_random".localized() }
    static var training_category_custom: String { "training_category_custom".localized() }
    
    static var training_category_lifeguard_description: String { "training_category_lifeguard_description".localized() }
    static var training_category_everything4x_description: String { "training_category_everything4x_description".localized() }
    static var training_category_endurance_description: String { "training_category_endurance_description".localized() }
    static var training_category_tooFastForYou_description: String { "training_category_tooFastForYou_description".localized() }
    static var training_category_random_description: String { "training_category_random_description".localized() }
    static var training_category_custom_description: String { "training_category_custom_description".localized() }
    
    static var no_internet: String { "no_internet".localized() }
    static var no_internet_msg: String { "no_internet_msg".localized() }
    
    static var no_statistics: String { "no_statistics".localized() }
    static var no_statistics_msg: String { "no_statistics_msg".localized() }
    
    static var achievements: String { "achievements".localized() }
    static var no_achievements: String { "no_achievements".localized() }
    static var no_achievements_msg: String { "no_achievements_msg".localized() }
    
    static var start_training: String { "start_training".localized() }
    
    static var settings: String { "settings".localized() }
    static var select_language: String { "select_language".localized() }
    
    static var about_section_1_title: String { "about_section_1_title".localized() }
    static var about_section_1_text: String { "about_section_1_text".localized() }
    static var about_section_2_title: String { "about_section_2_title".localized() }
    static var about_section_2_text: String { "about_section_2_text".localized() }
    static var about_section_3_title: String { "about_section_3_title".localized() }
    static var about_section_3_text: String { "about_section_3_text".localized() }
    static var about_section_3_text_preIOS15: String { "about_section_3_text_preIOS15".localized() }
    static var about_section_4_title: String { "about_section_4_title".localized() }
    static var about_section_4_text: String { "about_section_4_text".localized() }
}

extension String {
    
    func localized() -> String {
        @Dependency var persistenceService: PersistenceServiceProtocol
        
        let lang = persistenceService.language.rawValue
        
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
