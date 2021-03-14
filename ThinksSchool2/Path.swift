
import SwiftUI
import Accelerate

class CustomPath {
    var path: Path
    var start: CGPoint
    var end: CGPoint
    var control: CGPoint
    let kSubdivisions = 150
    var curveLength: CGFloat {
        var totalLength: CGFloat = 0.0
        var prevPoint = start

        for i in 1...kSubdivisions {
            let currentPoint = point(at: CGFloat(i))

            let diff = CGPoint(x: currentPoint.x - prevPoint.x, y: currentPoint.y - prevPoint.y)

            totalLength += CGFloat(sqrtf(Float(diff.x * diff.x + diff.y * diff.y)))

            prevPoint = currentPoint
        }

        return totalLength
    }
    
    init(startPoint: CGPoint, endPoint: CGPoint, control: CGPoint) {
        self.start = startPoint
        self.end = endPoint
        self.control = control
        self.path = Path({ (path) in
            path.move(to: startPoint)
            path.addQuadCurve(to: endPoint, control: control)
        })
    }
    
    func point(at step: CGFloat) -> CGPoint {
        
        let t = 1 / CGFloat(kSubdivisions) * step

        // x = (1-t)^2 * Sx + 2t * (1 - t) * Cx + t^2 * Ex
        let x = CGFloat((1.0 - t) * (1.0 - t)) * start.x + CGFloat(2.0 * (1.0 - t) * t) * control.x + CGFloat(t * t) * end.x
        let y = CGFloat((1.0 - t) * (1.0 - t)) * start.y + CGFloat(2.0 * (1.0 - t) * t) * control.y + CGFloat(t * t) * end.y
        return CGPoint(x: x, y: y)
    }
    
    func angle(at step: CGFloat) -> Angle {
        let currentPoint = point(at: step)
        if step == 1 {
            let nextPoint = point(at: step + 1)
            let y = currentPoint.y - nextPoint.y
            let x = nextPoint.x - nextPoint.x
            let degrees = atan(y/x)
            return Angle(radians: -Double(degrees))
        }
        let prevPoint = point(at: step - 1)
        let y = currentPoint.y - prevPoint.y
        let x = prevPoint.x - currentPoint.x
        let degrees = atan(y/x)
        return Angle(radians: -Double(degrees))
    }

}
