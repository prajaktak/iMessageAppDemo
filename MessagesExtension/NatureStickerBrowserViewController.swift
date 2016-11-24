
//
//  NatureStickerBrowserViewController.swift
//  iMessageAppDemo
//
//  Created by Prajakta Kulkarni on 11/22/16.
//  Copyright © 2016 Prajakta Kulkarni. All rights reserved.
//

import Foundation

import UIKit
import Messages

class NatureStickerBrowserViewController: MSStickerBrowserViewController{
    var stickers = [MSSticker]()
    
    func changeBrowserViewBackgroundColor(color:UIColor) {
        stickerBrowserView.backgroundColor =  color
    }
    
    func loadStickers() {
        
        for i in 0 ..< 8
        {
            createSteaker(asset: "Flower"+i.description  ,localizedDescription: "Flower")
        }
    }
    
    func createSteaker(asset:String, localizedDescription:String) {
        guard let stickerPath = Bundle.main.path(forResource: asset, ofType: "png") else {
            print("Couldn't create the sticker path for", asset)
            return
        }
        let stickerUrl = URL(fileURLWithPath: stickerPath)
        let sticker : MSSticker
        
        do{
            try sticker = MSSticker(contentsOfFileURL: stickerUrl, localizedDescription: localizedDescription)
            stickers.append(sticker)
        }catch{
            print(error)
            return
        }
    }
    
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}
