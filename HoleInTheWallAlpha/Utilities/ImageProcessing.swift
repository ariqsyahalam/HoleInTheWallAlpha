//
//  ImageProcessing.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 22/05/24.
//

import Cocoa
import CoreVideo

func buffer(from image: NSImage) -> CVPixelBuffer? {
    guard let tiffData = image.tiffRepresentation,
          let bitmapImage = NSBitmapImageRep(data: tiffData) else {
        return nil
    }
    
    let width = 299
    let height = 299
    
    let attrs = [
        kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
        kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue
    ] as CFDictionary
    
    var pixelBuffer: CVPixelBuffer?
    let status = CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
    
    guard status == kCVReturnSuccess, let buffer = pixelBuffer else {
        return nil
    }
    
    CVPixelBufferLockBaseAddress(buffer, .readOnly)
    guard let context = CGContext(data: CVPixelBufferGetBaseAddress(buffer),
                                  width: width,
                                  height: height,
                                  bitsPerComponent: 8,
                                  bytesPerRow: CVPixelBufferGetBytesPerRow(buffer),
                                  space: CGColorSpaceCreateDeviceRGB(),
                                  bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue) else {
        CVPixelBufferUnlockBaseAddress(buffer, .readOnly)
        return nil
    }
    
    let imageRect = CGRect(x: 0, y: 0, width: width, height: height)
    context.draw(bitmapImage.cgImage!, in: imageRect)
    CVPixelBufferUnlockBaseAddress(buffer, .readOnly)
    
    return buffer
}
