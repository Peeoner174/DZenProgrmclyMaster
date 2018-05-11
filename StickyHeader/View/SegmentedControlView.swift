import UIKit

class SegmentedControlView: UIView {
    
    var segmentControl = UISegmentedControl(items: ["ОБО МНЕ", "МОИ ПОЕЗДКИ"])
  
    override init(frame:CGRect) {
        super.init(frame: frame)

        setSegmentedControl()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///
    
    func setSegmentedControl() {
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.tintColor = UIColor(red: 250/255, green: 97/255, blue: 80/255, alpha: 1)
        segmentControl.backgroundColor = UIColor.white
//        segmentControl.selectedSegmentIndex = 1
        addSubview(segmentControl)
        
        let titlesConstraints:[NSLayoutConstraint] = [
            segmentControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmentControl.topAnchor.constraint(equalTo: topAnchor, constant: 6), //constant - дополнительный отступ относительно equalTo
           // segmentControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 6), //constant - дополнительный отступ относительно equalTo

            segmentControl.widthAnchor.constraint(equalToConstant: 280),
            segmentControl.heightAnchor.constraint(equalToConstant: 28)
        ]
        NSLayoutConstraint.activate(titlesConstraints)
    }
}
