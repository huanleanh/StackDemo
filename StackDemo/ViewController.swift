//
//  ViewController.swift
//  StackDemo
//
//  Created by Le Anh Huan on 22/01/2024.
//

import UIKit

enum State: Int {
    case stateOne
    case stateTwo
    case stateThree
    case stateFour
}

class ViewController: UIViewController {
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var mainStackView: UIStackView!
    
    @IBOutlet weak var offlineStackView: UIStackView!
    
    @IBOutlet weak var deviceStatusView: UIStackView!
    @IBOutlet weak var deviceStatusLabelView: UIView!
    @IBOutlet weak var deviceGroupStatusStackView: UIStackView!
    @IBOutlet weak var deviceLeftSpeakerEffect: UIImageView!
    @IBOutlet weak var deviceRightSpeakerEffect: UIImageView!
    @IBOutlet weak var deviceConnectionModeImage: UIImageView!
    @IBOutlet weak var deviceLogoImage: UIImageView!
    @IBOutlet weak var deviceGroupButtonView: UIView!
    @IBOutlet weak var deviceStatusLabel: UILabel!
    @IBOutlet weak var deviceGroupButton: UIButton!
    
    @IBOutlet weak var soundFromConnectionLogoImage: UIImageView!
    @IBOutlet weak var soundFromInfoLabel: UILabel!
    @IBOutlet weak var soundFromSubInfoLabel: UILabel!
    
    @IBOutlet weak var playerGroupVolumeStack: UIStackView!
    @IBOutlet weak var playerAlbumImageView: UIView!
    @IBOutlet weak var playerRepeatButtonImage: UIImageView!
    @IBOutlet weak var playerNextButtonImage: UIImageView!
    @IBOutlet weak var playerPlayButtonImage: UIImageView!
    @IBOutlet weak var playerPreviousButtonImage: UIImageView!
    @IBOutlet weak var playerSuffleButtonImage: UIImageView!
    @IBOutlet weak var playerSongDescriptionLabel: UILabel!
    @IBOutlet weak var playerSongTittleLabel: UILabel!
    @IBOutlet weak var playerMusicServiceLabel: UILabel!
    @IBOutlet weak var playerAlbumImage: UIImageView!
    @IBOutlet weak var playerMusicServiceView: UIView!
    @IBOutlet weak var playerExpandButtonImage: UIImageView!
    @IBOutlet weak var playerBottomSongConstraint: UIView!
    @IBOutlet weak var playerSubVolumeStackView: UIStackView!
    
    @IBOutlet weak var settingsAVAStackView: UIStackView!
    @IBOutlet weak var settingsEqualizerStackView: UIStackView!
    @IBOutlet weak var settingsSmartHubStackView: UIStackView!
    @IBOutlet weak var settingsSoundStackView: UIStackView!
    @IBOutlet weak var settingsSpaceFitStackView: UIStackView!
    @IBOutlet weak var settingsCustomStackView: UIStackView!
    @IBOutlet weak var settingAdvancedStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func updateAllUI(with state: State) {
        updateStatusView(with: state)
        updateSoundFrom(with: state)
        updatePlayer(with: state)
        updateSettingsView(with: state)
        updateOfflineState(with: state)
    }
    
    func loopThroughStackViews(in parentStackView: UIStackView) {
        for subview in parentStackView.arrangedSubviews {
            if let subviewAsStackView = subview as? UIStackView {
                // Nếu subview là stack view khác, tiếp tục lặp qua nó
                loopThroughStackViews(in: subviewAsStackView)
            } else {
                // Thực hiện hành động với view con nếu nó không phải là stack view
                print("View con: \(subview)")
                
                // Ví dụ: Thay đổi thuộc tính alpha và userInteractionEnabled của view con
                subview.alpha = 0.5
                subview.isUserInteractionEnabled = false
            }
        }
    }

    
    func updateOfflineState(with state: State) {
        if(state == .stateTwo) {
            for subView in mainStackView.arrangedSubviews {
                if subView == offlineStackView {
                    subView.isHidden = false
                } else {
                    subView.alpha = 0.5
                    subView.isUserInteractionEnabled = false
                }
            }
        } else {
            for subView in mainStackView.arrangedSubviews {
                if subView == offlineStackView {
                    subView.isHidden = true
                } else {
                    subView.alpha = 1
                    subView.isUserInteractionEnabled = true
                }
            }
        }
    }
    
    func setup() {
        func setupUI() {
            updateAllUI(with: .stateOne)
        }
        
        func setupAction() {
            
        }
        
        setupUI()
        setupAction()
    }
    
    
    
    func updateStatusView(with state: State) {
            updateDeviceImage(with: state)
            updateConnectionModeImage(with: state)
            updateSpeakerLabel(with: state)
            updateGroupButton(with: state)
    }
    
    func updateDeviceImage(with state: State) {
        switch state {
        case .stateOne:
            deviceLogoImage.image = UIImage(named: "ic_sb_stt_frame")

        case .stateTwo:
            deviceLogoImage.image = UIImage(named: "ic_sb_stt_sounbar")

        case .stateThree:
            deviceLogoImage.image = UIImage(named: "ic_sb_stt_symphony")

        case .stateFour:
            deviceLogoImage.image = UIImage(named: "ic_sb_stt_frame")
        }
    }
    
    func updateConnectionModeImage(with state: State) {
        switch state {
        case .stateTwo: 
            deviceConnectionModeImage.image = UIImage(named: "sb_ic_network_3")
            
        case .stateThree: 
            deviceConnectionModeImage.image = UIImage(named: "sb_ic_network_wired")
            
        default: 
            deviceConnectionModeImage.image = UIImage(named: "ic_bluetooth")
        }
    }
    
    func updateGroupButton(with state: State) {
        switch state {
        case .stateOne:
            deviceGroupButton.setTitle("", for:  .normal)
            deviceGroupButtonView.isHidden = true
            
        case .stateTwo:
            deviceGroupButton.setTitle("", for:  .normal)
            deviceGroupButtonView.isHidden = true

            
        case .stateThree:
            deviceGroupButton.setTitle("Create Group", for:  .normal)
            deviceGroupButtonView.isHidden = false
            
        case .stateFour:
            deviceGroupButton.setTitle("Leave Group", for:  .normal)
            deviceGroupButtonView.isHidden = false
        }
    }

    
    func updateSpeakerLabel(with state: State) {
        switch state {
        case .stateOne: 
            deviceStatusLabel.text = ""
            deviceStatusLabelView.isHidden = true
            
        case .stateTwo:
            deviceStatusLabel.text = "Adaptive Sound+"
            deviceStatusLabelView.isHidden = false
            
        case .stateThree:
            deviceStatusLabel.text = ""
            deviceStatusLabelView.isHidden = true
            
        case .stateFour:
            deviceStatusLabel.text = "Group Play"
            deviceStatusLabelView.isHidden = false
            
        }
    }
    
    
    
    func updateSoundFrom(with state: State) {
        switch state {
        case .stateOne:
            soundFromConnectionLogoImage.image = UIImage(named: "sb_ic_soundfrom_deezer")
            soundFromInfoLabel.text = "Deezer"
            soundFromSubInfoLabel.text = "Wifi"
        case .stateTwo:
            soundFromConnectionLogoImage.image = UIImage(named: "sb_ic_google_cast")
            soundFromInfoLabel.text = "Chrome Cast"
            soundFromSubInfoLabel.text = "Wifi"
        case .stateThree:
            soundFromConnectionLogoImage.image = UIImage(named: "sb_ic_network_wired")
            soundFromInfoLabel.text = "Air Play"
            soundFromSubInfoLabel.text = "Wifi"
        case .stateFour:
            soundFromConnectionLogoImage.image = UIImage(named: "spk_network_status_ic_noti_ai")
            soundFromInfoLabel.text = "No Device connected"
            soundFromSubInfoLabel.text = "Not connected"
        }
    }
    
    func updatePlayer(with state: State) {
        switch state {
        case .stateOne:
//            playerAlbumImage.isHidden = false
            playerAlbumImage.image = UIImage(named: "sb_spotify_logo2")
            
            playerSongTittleLabel.textAlignment = .left
            playerSongDescriptionLabel.textAlignment = .left
            playerBottomSongConstraint.isHidden = false

            playerAlbumImageView.isHidden = false
            playerMusicServiceView.isHidden = false
            playerSuffleButtonImage.isHidden = false
            playerRepeatButtonImage.isHidden = false
            playerGroupVolumeStack.isHidden = true
            playerSubVolumeStackView.isHidden = true
            
        case .stateTwo:
//            playerAlbumImage.isHidden = true
            playerAlbumImageView.isHidden = true
            playerSongTittleLabel.textAlignment = .center
            playerSongDescriptionLabel.textAlignment = .center
            playerBottomSongConstraint.isHidden = true
            
            playerMusicServiceView.isHidden = true
            playerSuffleButtonImage.isHidden = true
            playerRepeatButtonImage.isHidden = true
            playerSubVolumeStackView.isHidden = true
            playerGroupVolumeStack.isHidden = false
            
        case .stateThree:
//            playerAlbumImage.isHidden = false
            playerAlbumImageView.isHidden = false

            playerAlbumImage.image = UIImage(named: "wake-me-up-2cellos")
            playerSongTittleLabel.textAlignment = .left
            playerSongDescriptionLabel.textAlignment = .left
            playerBottomSongConstraint.isHidden = false
            
            playerMusicServiceView.isHidden = false
            playerSuffleButtonImage.isHidden = true
            playerRepeatButtonImage.isHidden = true
            playerSubVolumeStackView.isHidden = true
            playerGroupVolumeStack.isHidden = false


        case .stateFour:
//            playerAlbumImage.isHidden = false
            playerAlbumImageView.isHidden = false

            playerAlbumImage.image = UIImage(named: "wake-me-up-2cellos")
            playerSongTittleLabel.textAlignment = .left
            playerSongDescriptionLabel.textAlignment = .left
            playerBottomSongConstraint.isHidden = false
            
            playerMusicServiceView.isHidden = false
            playerSuffleButtonImage.isHidden = true
            playerRepeatButtonImage.isHidden = true
            playerSubVolumeStackView.isHidden = true
            playerGroupVolumeStack.isHidden = false


        }
    }
    
    func updateSettingsView(with state: State) {
        switch state {
        case .stateOne: 
            settingsAVAStackView.isHidden = false
            settingsEqualizerStackView.isHidden = false
            settingsSmartHubStackView.isHidden = true
            settingsSoundStackView.isHidden = true
            settingsSpaceFitStackView.isHidden = false
            settingsCustomStackView.isHidden = true
            settingAdvancedStackView.isHidden = false
            
            settingsAVAStackView.alpha = 1
            settingsAVAStackView.isUserInteractionEnabled = true
            
            settingsEqualizerStackView.alpha = 0.5
            settingsEqualizerStackView.isUserInteractionEnabled = false
            
            settingsSmartHubStackView.alpha = 1
            settingsSmartHubStackView.isUserInteractionEnabled = true
            
            settingsSoundStackView.alpha = 1
            settingsSoundStackView.isUserInteractionEnabled = true
            
            settingsSpaceFitStackView.alpha = 0.5
            settingsSpaceFitStackView.isUserInteractionEnabled = false
            
            settingsCustomStackView.alpha = 1
            settingsCustomStackView.isUserInteractionEnabled = true
            
            settingAdvancedStackView.alpha = 1
            settingAdvancedStackView.isUserInteractionEnabled = true
            
        case .stateTwo:
            settingsAVAStackView.isHidden = false
            settingsEqualizerStackView.isHidden = false
            settingsSmartHubStackView.isHidden = false
            settingsSoundStackView.isHidden = false
            settingsSpaceFitStackView.isHidden = false
            settingsCustomStackView.isHidden = false
            settingAdvancedStackView.isHidden = false
            
            settingsAVAStackView.alpha = 1
            settingsAVAStackView.isUserInteractionEnabled = true
            
            settingsEqualizerStackView.alpha = 0.5
            settingsEqualizerStackView.isUserInteractionEnabled = false
            
            settingsSmartHubStackView.alpha = 0.5
            settingsSmartHubStackView.isUserInteractionEnabled = false
            
            settingsSoundStackView.alpha = 0.5
            settingsSoundStackView.isUserInteractionEnabled = false
            
            settingsSpaceFitStackView.alpha = 0.5
            settingsSpaceFitStackView.isUserInteractionEnabled = false
            
            settingsCustomStackView.alpha = 0.5
            settingsCustomStackView.isUserInteractionEnabled = false
            
            settingAdvancedStackView.alpha = 1
            settingAdvancedStackView.isUserInteractionEnabled = true
            
        case .stateThree:
            settingsAVAStackView.isHidden = true
            settingsEqualizerStackView.isHidden = false
            settingsSmartHubStackView.isHidden = true
            settingsSoundStackView.isHidden = true
            settingsSpaceFitStackView.isHidden = true
            settingsCustomStackView.isHidden = true
            settingAdvancedStackView.isHidden = false
            
            settingsAVAStackView.alpha = 1
            settingsAVAStackView.isUserInteractionEnabled = true
            
            settingsEqualizerStackView.alpha = 0.5
            settingsEqualizerStackView.isUserInteractionEnabled = false
            
            settingsSmartHubStackView.alpha = 1
            settingsSmartHubStackView.isUserInteractionEnabled = true
            
            settingsSoundStackView.alpha = 1
            settingsSoundStackView.isUserInteractionEnabled = true
            
            settingsSpaceFitStackView.alpha = 0.5
            settingsSpaceFitStackView.isUserInteractionEnabled = false
            
            settingsCustomStackView.alpha = 1
            settingsCustomStackView.isUserInteractionEnabled = true
            
            settingAdvancedStackView.alpha = 1
            settingAdvancedStackView.isUserInteractionEnabled = true
            
        case .stateFour:
            settingsAVAStackView.isHidden = true
            settingsEqualizerStackView.isHidden = false
            settingsSmartHubStackView.isHidden = false
            settingsSoundStackView.isHidden = false
            settingsSpaceFitStackView.isHidden = true
            settingsCustomStackView.isHidden = false
            settingAdvancedStackView.isHidden = false
            
            settingsAVAStackView.alpha = 1
            settingsAVAStackView.isUserInteractionEnabled = true
            
            settingsEqualizerStackView.alpha = 0.5
            settingsEqualizerStackView.isUserInteractionEnabled = false
            
            settingsSmartHubStackView.alpha = 1
            settingsSmartHubStackView.isUserInteractionEnabled = true
            
            settingsSoundStackView.alpha = 1
            settingsSoundStackView.isUserInteractionEnabled = true
            
            settingsSpaceFitStackView.alpha = 0.5
            settingsSpaceFitStackView.isUserInteractionEnabled = false
            
            settingsCustomStackView.alpha = 1
            settingsCustomStackView.isUserInteractionEnabled = true
            
            settingAdvancedStackView.alpha = 1
            settingAdvancedStackView.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func stateOneClicked(_ sender: Any) {
        updateAllUI(with: .stateOne)
    }
    
    @IBAction func stateTwoClicked(_ sender: Any) {
        updateAllUI(with: .stateTwo)
    }
    
    @IBAction func stateThreeClicked(_ sender: Any) {
        updateAllUI(with: .stateThree)
    }
    
    @IBAction func stateFourClicked(_ sender: Any) {
        updateAllUI(with: .stateFour)
    }
    
    @IBAction func playerExpandVolumeButtonClicked(_ sender: Any) {
        playerSubVolumeStackView.isHidden = playerSubVolumeStackView.isHidden ? false : true
        playerExpandButtonImage.image = playerExpandButtonImage.image == UIImage(named: "ic_expand_open") ? 
        UIImage(named: "ic_expand_close"):
        UIImage(named: "ic_expand_open")
    }
    
    @IBAction func testButton(_ sender: Any) {
        print("clicked")
    }
    
}

