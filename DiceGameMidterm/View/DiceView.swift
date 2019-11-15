//
//  DiceView.swift
//  DiceGameMidterm
//
//  Created by Sabri Sönmez on 11/13/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class DiceView: UIView
{

    var color : Dice.Color = Dice.Color.green {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    
    var number : Dice.Number = Dice.Number.one {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    private var colorForPath : UIColor {
        switch color {
        case .red:
             return Color.red
        case .purple:
             return Color.purple
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        }
    }
   
    private func drawCirce() {
      //  let circle = UIBezierPath(arcCenter: CGPoint(x: 100, y: 100), radius: CGFloat(20), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
       // path = UIBezierPath()
        
        //path.addArc(withCenter: CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2), radius: 15, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        
       // path.close()
//        path.move(to: .zero)
//        path.addLine(to: CGPoint(x: 50, y: 50))
//        path.addLine(to: CGPoint(x: 50, y: 150))
//        path.addLine(to: CGPoint(x: 150, y: 50))
//        path.addLine(to: .zero)
//        path.close()

      

    }
    
    private func drawCircle() -> UIBezierPath {
        
        let circle = UIBezierPath()
        circle.addArc(withCenter: CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2), radius: 15, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        
        circle.close()
        
        return circle
    }
    
    
    private func showPath(_ path: UIBezierPath) {
        var path = replicatePath(path)
        colorForPath.setStroke()
        path = shadePath(path)
        path.lineWidth = 2.0
        path.stroke()
        path.fill()
    }
    
    private func replicatePath(_ path: UIBezierPath) -> UIBezierPath {
        let replicatedPath = UIBezierPath()
        
        if number == .one {
            replicatedPath.append(path)
        } else if number == .two {
            let leftPath = UIBezierPath()
            leftPath.append(path)
            let leftPathTransform = CGAffineTransform(
                translationX: leftTwoPathTranslation.x, y: leftTwoPathTranslation.y)
            leftPath.apply(leftPathTransform)
            
            let rightPath = UIBezierPath()
            rightPath.append(path)
            let rightPathTransform = CGAffineTransform(
                translationX: rightTwoPathTranslation.x, y: rightTwoPathTranslation.y)
            rightPath.apply(rightPathTransform)
            
            replicatedPath.append(leftPath)
            replicatedPath.append(rightPath)
        } else if number == .three {
            let leftPath = UIBezierPath()
            leftPath.append(path)
            let leftPathTransform = CGAffineTransform(
                translationX: leftThreePathTranslation.x, y: leftThreePathTranslation.y)
            leftPath.apply(leftPathTransform)
            
            let rightPath = UIBezierPath()
            rightPath.append(path)
            let rightPathTransform = CGAffineTransform(
                translationX: rightThreePathTranslation.x, y: rightThreePathTranslation.y)
            rightPath.apply(rightPathTransform)
            
            replicatedPath.append(leftPath)
            replicatedPath.append(path)
            replicatedPath.append(rightPath)
        }else if number == .four {
            
            let leftPath = UIBezierPath()
            leftPath.append(path)
            let leftPathTransform = CGAffineTransform(
                translationX: leftfourPathTranslation.x, y: leftfourPathTranslation.y)
            leftPath.apply(leftPathTransform)
            
            let leftUpPath = UIBezierPath()
            leftUpPath.append(path)
            let leftUpPathTransform = CGAffineTransform(
                translationX: leftUpfourPathTranslation.x, y: leftUpfourPathTranslation.y)
            leftUpPath.apply(leftUpPathTransform)
            
            let rightPath = UIBezierPath()
            rightPath.append(path)
            let rightPathTransform = CGAffineTransform(
                translationX: rightfourPathTranslation.x, y: rightfourPathTranslation.y)
            rightPath.apply(rightPathTransform)
            
            let rightUpPath = UIBezierPath()
            rightUpPath.append(path)
            let rightUpPathTransform = CGAffineTransform(
                translationX: rightUpfourPathTranslation.x, y: rightUpfourPathTranslation.y)
            rightUpPath.apply(rightUpPathTransform)
            
            replicatedPath.append(leftPath)
            replicatedPath.append(leftUpPath)
            replicatedPath.append(rightPath)
            replicatedPath.append(rightUpPath)
            
        }else if number == .five {
            let leftPath = UIBezierPath()
            leftPath.append(path)
            let leftPathTransform = CGAffineTransform(
                translationX: leftThreePathTranslation.x, y: leftThreePathTranslation.y)
            leftPath.apply(leftPathTransform)
            
            let rightPath = UIBezierPath()
            rightPath.append(path)
            let rightPathTransform = CGAffineTransform(
                translationX: rightThreePathTranslation.x, y: rightThreePathTranslation.y)
            rightPath.apply(rightPathTransform)
            
            replicatedPath.append(leftPath)
            replicatedPath.append(path)
            replicatedPath.append(rightPath)
        }
        else if number == .six
{
            let leftPath = UIBezierPath()
            leftPath.append(path)
            let leftPathTransform = CGAffineTransform(
                translationX: leftThreePathTranslation.x, y: leftThreePathTranslation.y)
            leftPath.apply(leftPathTransform)
            
            let rightPath = UIBezierPath()
            rightPath.append(path)
            let rightPathTransform = CGAffineTransform(
                translationX: rightThreePathTranslation.x, y: rightThreePathTranslation.y)
            rightPath.apply(rightPathTransform)
            
            replicatedPath.append(leftPath)
            replicatedPath.append(path)
            replicatedPath.append(rightPath)
        }
        
        return replicatedPath
    }
   
    private func shadePath(_ path: UIBezierPath) -> UIBezierPath {
        let shadedPath = UIBezierPath()
        shadedPath.append(path)
        colorForPath.setFill()
        
        return shadedPath
    }
    
    
    override func draw(_ rect: CGRect) {
        
       
            let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 0.0)
            roundedRect.addClip()
            
            UIColor.white.setFill()
            roundedRect.fill()
            roundedRect.stroke()
            
            let path = UIBezierPath()
            path.append(drawCircle())
        
            showPath(path)
        
  
        
    }
  

}


    
    

extension DiceView{
    /***********************************************************/
    /*                                                         */
    /* Corner Radius                                           */
    /*                                                         */
    /***********************************************************/
    
    private var cornerRadius: CGFloat {
        return bounds.size.height * 0.06
    }
}




// extension for color literals
extension DiceView {
    private struct Color {
        static let white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        static let diceBackgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        static let blue = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
        static let purple = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        static let red = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 0.8763110017)
        static let green = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
    }
}


extension DiceView {
    /***********************************************************/
    /*                                                         */
    /* Path Replication Constants                              */
    /*                                                         */
    /***********************************************************/
    
    // 2 die
    private var leftTwoPathTranslation: CGPoint {
        return CGPoint(x: self.bounds.size.width * -0.25,
                       y: 0.0)
    }
    
    private var rightTwoPathTranslation: CGPoint {
        return CGPoint(x: self.bounds.size.width * 0.25,
                       y: 0.0)
    }
    
    //3 die
    private var leftThreePathTranslation: CGPoint {
        return CGPoint(x: self.bounds.size.width * -0.25,
                       y: self.bounds.size.height * -0.2)
    }
    
    private var rightThreePathTranslation: CGPoint {
        return CGPoint(x: self.bounds.size.width * 0.25,
                       y: self.bounds.size.height * 0.2)
    }
    
    //4 die
    private var leftfourPathTranslation: CGPoint {
        return CGPoint(x: self.bounds.size.width * -0.25,
                       y: self.bounds.height * -0.2 )
    }
    
    private var leftUpfourPathTranslation: CGPoint {
        return CGPoint(x: self.bounds.size.width * -0.25,
                       y: self.bounds.height * 0.2)
    }
    
    private var rightfourPathTranslation: CGPoint {
        return CGPoint(x: self.bounds.size.width * 0.25,
                       y: self.bounds.height * -0.2)
    }
    private var rightUpfourPathTranslation: CGPoint {
        return CGPoint(x: self.bounds.size.width * 0.25,
                       y: self.bounds.height * 0.2)
    }
    
    //5 die
   
}
