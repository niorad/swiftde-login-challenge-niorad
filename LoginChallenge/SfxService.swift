//
//  SfxService.swift
//  PixelFaceMaker
//
//  Created by Antonio Radovcic on 12.05.16.
//  Copyright © 2016 Niorad. All rights reserved.
//

import Foundation
import AVFoundation

class SfxService {
    
    static let instance = SfxService()

    var wooshSoundUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("woosh", ofType: "wav")!)
    var loginSoundUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("login", ofType: "wav")!)
    var affirmSoundUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("affirm", ofType: "wav")!)
    var availableSounds: Dictionary<Sound, AVAudioPlayer> = [:]
    
    enum Sound {
        case Woosh
        case Affirm
        case Login
    }
    
    init() {
        
        do {
            availableSounds[.Woosh] = try AVAudioPlayer(contentsOfURL: wooshSoundUrl)
            availableSounds[.Login] = try AVAudioPlayer(contentsOfURL: loginSoundUrl)
            availableSounds[.Affirm] = try AVAudioPlayer(contentsOfURL: affirmSoundUrl)
        } catch {
            print("No sound for this guy")
        }

        availableSounds[.Woosh]?.prepareToPlay()
        availableSounds[.Login]?.prepareToPlay()
        availableSounds[.Affirm]?.prepareToPlay()

    }
    
    func playSound(sound: Sound) {
        self.availableSounds[sound]!.play()
    }


}