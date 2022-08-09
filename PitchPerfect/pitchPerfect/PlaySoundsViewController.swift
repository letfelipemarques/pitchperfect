//
//  PlaySoundsViewController.swift
//  pitchPerfect
//
//  Created by Felipe Marques on 20/03/22.
//

import UIKit
import AVFoundation

final class PlaySoundsViewController: UIViewController {
    
    private enum Constants {
        static let slowRate: Float = 0.5
        static let fastRate: Float = 1.5
        static let highPitch: Float = 1000
        static let lowPitch: Float = -1000
    }
    
    var recordedAudioURL: URL!
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    private enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        
        switch(ButtonType(rawValue: sender.tag)!) {
          case .slow:
            playSound(rate: Constants.slowRate)
          case .fast:
            playSound(rate: Constants.fastRate)
          case .chipmunk:
            playSound(pitch: Constants.highPitch)
          case .vader:
            playSound(pitch: Constants.lowPitch)
          case .echo:
              playSound(echo: true)
          case .reverb:
              playSound(reverb: true)
          }
        
          configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        stopAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
}
