//
//  Localizable.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import Foundation

enum Localizable {
    
    // MARK: - Common
    static var cancel: String { "cancel".localized() }
    static var category: String { "category".localized() }
    static var clear: String { "clear".localized() }
    static var discard: String { "discard".localized() }
    static var distance: String { "distance".localized() }
    static var done: String { "done".localized() }
    static var confirm: String { "confirm".localized() }
    static var log_out: String { "log_out".localized() }
    static var name: String { "name".localized() }
    static var no: String { "no".localized() }
    static var other: String { "other".localized() }
    static var select: String { "select".localized() }
    static var time: String { "time".localized() }
    static var yes: String { "yes".localized() }
    
    // MARK: - Miscellaneous
    static var watch_wanna_do: String { "watch_wanna_do".localized() }
    static var delete_training: String { "delete_training".localized() }
    static var share_training: String { "share_training".localized() }
    static var confirmation_log_out_title: String { "confirmation_log_out_title".localized() }
    static var confirmation_log_out_message: String { "confirmation_log_out_message".localized() }
    static var confirmation_delete_training_title: String { "confirmation_delete_training_title".localized() }
    static var confirmation_delete_training_message: String { "confirmation_delete_training_message".localized() }
    
    static var start_training: String { "start_training".localized() }
    
    // MARK: - Home
    static var greeting_without_name: String { "greeting_without_name".localized() }
    static var greeting_with_name: String { "greeting_with_name".localized() }
    
    static var continue_with_google: String { "continue_with_google".localized() }
    static var welcome_to: String { "welcome_to".localized() }
    static var not_available_abbr: String { "not_available_abbr".localized() }
    static var login: String { "login".localized() }
    static var register: String { "register".localized() }
    static var email: String { "email".localized() }
    static var password: String { "password".localized() }
    static var repeat_password: String { "repeat_password".localized() }
    static var register_msg: String { "register_msg".localized() }
    static var ok: String { "ok".localized() }
    static var retry: String { "retry".localized() }
    static var next: String { "next".localized() }
    static var start_swimming: String { "start_swimming".localized() }
    
    // MARK: - Trainings
    static var training: String { "training".localized() }
    static var trainings: String { "trainings".localized() }
    static var are_you_ready: String { "are_you_ready".localized() }
    static var lets_go: String { "lets_go".localized() }
    static var tap_add_exercises: String { "tap_add_exercises".localized() }
    static var what_youll_do: String { "what_youll_do".localized() }
    static var add_exercise: String { "add_exercise".localized() }
    static var exercise: String { "exercise".localized() }
    static var select_exercise: String { "select_exercise".localized() }
    static var choose_distance: String { "choose_distance".localized() }
    static var pick_time: String { "pick_time".localized() }
    static var amount: String { "amount".localized() }
    static var change: String { "change".localized() }
    static var optional: String { "optional".localized() }
    static var repetitions: String { "repetitions".localized() }
    static var time_limit: String { "time_limit".localized() }
    static var no_limit: String { "no_limit".localized() }
    static var meters: String { "meters".localized() }
    static var minute: String { "minute".localized() }
    static var minutes: String { "minutes".localized() }
    static var confirmation_discard_training_title: String { "confirmation_discard_training_title".localized() }
    static var confirmation_discard_training_message: String { "confirmation_discard_training_message".localized() }
    static var add_details: String { "add_details".localized() }
    static var add_notes: String { "add_notes".localized() }
    static var enter_name: String { "enter_name".localized() }
    static var confirmation_cancel_training_title: String { "confirmation_cancel_training_title".localized() }
    static var confirmation_cancel_training_message: String { "confirmation_cancel_training_message".localized() }
    
    // MARK: - Training Category
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
    
    static var exercise_style_freestyle: String { "exercise_style_freestyle".localized() }
    static var exercise_style_backStroke: String { "exercise_style_backStroke".localized() }
    static var exercise_style_chestStroke: String { "exercise_style_chestStroke".localized() }
    static var exercise_style_butterfly: String { "exercise_style_butterfly".localized() }
    static var exercise_style_dry: String { "exercise_style_dry".localized() }
    static var exercise_style_rest: String { "exercise_style_rest".localized() }
    static var exercise_style_stretching: String { "exercise_style_stretching".localized() }
    static var exercise_style_diving: String { "exercise_style_diving".localized() }
    static var exercise_style_sprint: String { "exercise_style_sprint".localized() }
    
    static var no_internet: String { "no_internet".localized() }
    static var no_internet_msg: String { "no_internet_msg".localized() }
    
    static var no_statistics: String { "no_statistics".localized() }
    static var no_statistics_msg: String { "no_statistics_msg".localized() }
    
    static var achievements: String { "achievements".localized() }
    static var no_achievements: String { "no_achievements".localized() }
    static var no_achievements_msg: String { "no_achievements_msg".localized() }
    
    // MARK: - Training Summary
    static var training_summary: String { "training_summary".localized() }
    static var exercises: String { "exercises".localized() }
    static var notes: String { "notes".localized() }
    
    // MARK: - Location Picker
    static var location: String { "location".localized() }
    static var pick_location: String { "pick_location".localized() }
    static var tap_to_search: String { "tap_to_search".localized() }
    static var no_result_found: String { "no_result_found".localized() }
    static var search_on_map: String { "search_on_map".localized() }
    static var insert_location_name: String { "insert_location_name".localized() }
    
    // MARK: - Statistics
    static var title_statistics: String { "title_statistics".localized() }
    static var wip_statistics_title: String { "wip_statistics_title".localized() }
    static var wip_statistics_message: String { "wip_statistics_message".localized() }
    
    // MARK: - Achievements
    static var title_achievements: String { "title_achievements".localized() }
    static var wip_achievements_title: String { "wip_achievements_title".localized() }
    static var wip_achievements_message: String { "wip_achievements_message".localized() }
    
    // MARK: - Setttings
    static var title_settings: String { "title_settings".localized() }
    
    static var setting_language: String { "setting_language".localized() }
    static var select_language: String { "select_language".localized() }
    static var language_english: String { "language_english".localized() }
    static var language_croatian: String { "language_croatian".localized() }
    
    static var setting_unit_system: String { "setting_unit_system".localized() }
    static var select_unit_system: String { "select_unit_system".localized() }
    static var unit_system_metric: String { "unit_system_metric".localized() }
    static var unit_system_imperial: String { "unit_system_imperial".localized() }
    
    // MARK: - Onboarding
    static var title_onboarding: String { "title_onboarding".localized() }

    static var onboarding_step_1_title: String { "onboarding_step_1_title".localized() }
    static var onboarding_step_1_message: String { "onboarding_step_1_message".localized() }
    static var onboarding_step_2_title: String { "onboarding_step_2_title".localized() }
    static var onboarding_step_2_message: String { "onboarding_step_2_message".localized() }
    static var onboarding_step_3_title: String { "onboarding_step_3_title".localized() }
    static var onboarding_step_3_message: String { "onboarding_step_3_message".localized() }
    
    // MARK: - About
    static var title_about: String { "title_about".localized() }
    
    static var about_section_1_title: String { "about_section_1_title".localized() }
    static var about_section_1_text: String { "about_section_1_text".localized() }
    static var about_section_2_title: String { "about_section_2_title".localized() }
    static var about_section_2_text: String { "about_section_2_text".localized() }
    static var about_section_3_title: String { "about_section_3_title".localized() }
    static var about_section_3_text: String { "about_section_3_text".localized() }
    static var about_section_3_text_preIOS15: String { "about_section_3_text_preIOS15".localized() }
    static var about_section_4_title: String { "about_section_4_title".localized() }
    static var about_section_4_text: String { "about_section_4_text".localized() }
    
//    static var : String { "".localized() }
//    static var : String { "".localized() }
//    static var : String { "".localized() }
//    static var : String { "".localized() }
    
}
