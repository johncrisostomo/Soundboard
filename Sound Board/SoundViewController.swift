//
//  SoundViewController.swift
//  Sound Board
//
//  Created by John Crisostomo on 10/04/2017.
//  Copyright © 2017 John Crisostomo. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    var audioRecorder: AVAudioRecorder? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRecorder()
    }
    
    func setupRecorder() {
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.overrideOutputAudioPort(.speaker)
            try session.setActive(true)
            
            let basePath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            
            let pathComponents = [basePath, "audio.m4a"]
            
            let audioURL = NSURL.fileURL(withPathComponents: pathComponents)
            
            print("-------------------")
            print(audioURL)
            print("-------------------")
            
            var settings: [String: AnyObject] = [:]
            
            settings[AVFormatIDKey] = kAudioFormatMPEG4AAC as AnyObject
            settings[AVSampleRateKey] = 44100.0 as AnyObject
            settings[AVNumberOfChannelsKey] = 2 as AnyObject
            
            
            audioRecorder = try AVAudioRecorder(url: audioURL!, settings: settings)
            audioRecorder!.prepareToRecord()
        } catch {}

    }
    
    @IBAction func recordTapped(_ sender: Any) {
        if (audioRecorder!.isRecording) {
            audioRecorder!.stop()
            recordButton.setTitle("Record", for: .normal)
        } else {
            audioRecorder!.record()
            recordButton.setTitle("Stop", for: .normal)
        }
    }
    
    @IBAction func playTapped(_ sender: Any) {
        
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        
    }
}
