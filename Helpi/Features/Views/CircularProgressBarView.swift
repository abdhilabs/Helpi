//
//  CircularProgressBarView.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 27/06/22.
//

import UIKit

class CircularProgressBarView: UIView {
  
  private var progressLayer = CAShapeLayer()
  private var startPoint = CGFloat(-Double.pi / 2)
  private var endPoint = CGFloat(3 * Double.pi / 2)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    createCircularPath()
  }
  
  func createCircularPath() {
    // created circularPath for circleLayer and progressLayer
    let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 80, startAngle: startPoint, endAngle: endPoint, clockwise: true)
    // progressLayer path defined to circularPath
    progressLayer.path = circularPath.cgPath
    // ui edits
    progressLayer.fillColor = UIColor.clear.cgColor
    progressLayer.lineCap = .round
    progressLayer.lineWidth = 6
    progressLayer.strokeEnd = 0
    progressLayer.strokeColor = #colorLiteral(red: 1, green: 0.1058823529, blue: 0.4196078431, alpha: 1).cgColor
    // added progressLayer to layer
    layer.addSublayer(progressLayer)
  }
  
  func progressAnimation(duration: TimeInterval) {
    // created circularProgressAnimation with keyPath
    let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
    // set the end time
    circularProgressAnimation.duration = duration
    circularProgressAnimation.toValue = 1.0
    circularProgressAnimation.fillMode = .forwards
    circularProgressAnimation.isRemovedOnCompletion = false
    progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
  }
}
