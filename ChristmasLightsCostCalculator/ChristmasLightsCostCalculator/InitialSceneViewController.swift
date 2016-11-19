//
//  InitialSceneViewController.swift
//  ChristmasLightsCostCalculator
//
//  Created by Aaron Martinez on 11/14/16.
//  Copyright © 2016 Aaron Martinez. All rights reserved.
//

import UIKit

class InitialSceneViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Properties
    
    var letsFindOutButton = UIButton()
    var gradientLayer: CAGradientLayer?
    var howMuchLabel = UILabel()
    
    var inputViewScene = UIView()
    
    var segmentedControllerView = UIView()
    let customSC = UISegmentedControl(items: ["Scenario 1", "Scenario 2"])
    var compareButton = UIButton()
    
    var bulbTypeView = UIView()
    var bulbTypeLabel = UILabel()
    var bulbTypePickerView = UIPickerView()
    var pickerData = [String]()
    var pickerTextField = UITextField()
    var wattsPerBulb: Double = 0
    
    var bulbCountView = UIView()
    var bulbCountLabel = UILabel()
    var bulbCountTextField = UITextField()
    
    var hoursPerDayView = UIView()
    var hoursPerDayLabel = UILabel()
    var hoursPerDayTextField = UITextField()
    
    var costPerkWhView = UIView()
    var costPerkWhLabel = UILabel()
    let pricePerkWh = 0.11
    var costPerkWhFixedLabel = UILabel()
    
    var daysRunningView = UIView()
    var daysRunningLabel = UILabel()
    var daysRunningTextField = UITextField()
    
    var totalCostView = UIView()
    var totalCostLabel = UILabel()
    var totalCostCalculatedLabel = UILabel()
    
    var calculateButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let christmasBackground = UIImageView(frame: self.view.frame)
        christmasBackground.image = #imageLiteral(resourceName: "Christmas Scene")
        
        self.view.addSubview(christmasBackground)
        
        UIApplication.shared.statusBarStyle = .lightContent
        
//        self.addDoneButtonOnKeyboard()
        
        setupButton()
        setupButtonConstraints()
        
        setupLabel()
        setupLabelContraints()
        
        pickerData = ["Choose bulb", "C9 Incandecent", "C9 LED", "C7 Incandecent", "C7 LED"]
        bulbTypePickerView.dataSource = self
        bulbTypePickerView.delegate = self


    }
    

    
    // MARK: - Button Functions
    
//        override func viewWillAppear(_ animated: Bool) {
//            createGradientLayer()
//        }
    
    func createGradientLayer() {
        
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = letsFindOutButton.bounds
        gradientLayer?.colors = [UIColor.red.cgColor, UIColor.white.cgColor]
        gradientLayer?.locations = [0.0, 1.0]
        guard let gradientLayer = gradientLayer else { return }
        letsFindOutButton.layer.addSublayer(gradientLayer)
        
    }

    func setupButton() {
        
        letsFindOutButton.backgroundColor = UIColor(red: 220/255, green: 60/255, blue: 60/255, alpha: 1)
        letsFindOutButton.setTitle("LET'S FIND OUT", for: .normal)
        letsFindOutButton.titleLabel?.font = UIFont(name: "Georgia", size: 24)
        letsFindOutButton.layer.cornerRadius = 25
        letsFindOutButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        self.view.addSubview(letsFindOutButton)
        
    }
    
    func buttonTapped() {
        

        setupInputViewScene()
        setupSegmentedControllerView()
        setupSegmentedController()
        setupCompareButton()
        setupBulbTypeView()
        setupBulbTypeLabel()
        setupPickerTextField()
        setupBulbCountView()
        setupBulbCountLabel()
        setupBulbCountTextField()
        setupHoursPerDayView()
        setupHoursPerDayLabel()
        setupHoursPerDayTextField()
        setupCostPerkWhView()
        setupCostPerkWhLabel()
        setupFixedCostLabel()
        setupDaysRunningView()
        setupDaysRunningLabel()
        setupDaysRunningTextField()
        setupTotalCostView()
        setupTotalCostLabel()
        setupTotalCostCalculatedLabel()
        setupCalculateButton()
        
        
        setupEachComponentContraints()
        
        animateViewAppearing()
        
    }
    
    func setupButtonConstraints() {
        
        letsFindOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonTop = NSLayoutConstraint(item: letsFindOutButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 120)
        let buttonCenterX = NSLayoutConstraint(item: letsFindOutButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let buttonWidth = NSLayoutConstraint(item: letsFindOutButton, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.6, constant: 0)
        let buttonHeight = NSLayoutConstraint(item: letsFindOutButton, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 50)
        
        self.view.addConstraints([buttonTop, buttonCenterX, buttonWidth, buttonHeight])
    }
    
    // MARK: - Label Functions
    
    func setupLabel() {
    
        howMuchLabel.text = "How much will it cost to run my Christmas Lights?"
        howMuchLabel.numberOfLines = 0
        howMuchLabel.lineBreakMode = .byWordWrapping
        howMuchLabel.textAlignment = .center
        howMuchLabel.font = UIFont(name: "Georgia", size: 26)
        howMuchLabel.textColor = .white
        
        self.view.addSubview(howMuchLabel)
        
    }
    
    func setupLabelContraints() {
    
        howMuchLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let labelTop = NSLayoutConstraint(item: howMuchLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 40)
        let labelLeading = NSLayoutConstraint(item: howMuchLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 40)
        let labelTrailing = NSLayoutConstraint(item: howMuchLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -40)
        
        self.view.addConstraints([labelTop, labelLeading, labelTrailing])
    }
    
}


extension InitialSceneViewController {
    
    func compareButtonTapped() {
        
        
    }
    
    func calculateButtonTapped() {
        
        guard let bulbType = pickerTextField.text,
            let bulbCountText = bulbCountTextField.text,
            let bulbCount = Int(bulbCountText),
            let hoursPerDayText = hoursPerDayTextField.text,
            let hoursPerDay = Int(hoursPerDayText),
            let daysPerYearText = daysRunningTextField.text,
            let daysPerYear = Int(daysPerYearText)
            else {  let alertController = UIAlertController(title: "Oops", message: "All fields require an answer", preferredStyle: .alert)
                let tryAgainAction = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
                alertController.addAction(tryAgainAction)
                self.present(alertController, animated: true, completion: nil)

            return }
        
        let totalCostString = EstimateController.calculateEnergyCosts(wattsPerBulb: wattsPerBulb, bulbCount: bulbCount, hoursPerDay: hoursPerDay, pricePerkWh: pricePerkWh, daysPerYear: daysPerYear)
        
        totalCostCalculatedLabel.text = totalCostString
        
    }
    
//    func segmentControllerValueChanged() {
//        
//        guard let bulbType = pickerTextField.text,
//            let bulbCountText = bulbCountTextField.text,
//            let bulbCount = Int(bulbCountText),
//            let hoursPerDayText = hoursPerDayTextField.text,
//            let hoursPerDay = Int(hoursPerDayText),
//            let daysPerYearText = daysRunningTextField.text,
//            let daysPerYear = Int(daysPerYearText)
//            else {  let alertController = UIAlertController(title: "Oops", message: "All fields require an answer", preferredStyle: .alert)
//                let tryAgainAction = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
//                alertController.addAction(tryAgainAction)
//                self.present(alertController, animated: true, completion: nil)
//                
//                return }
//        
//        let totalCostDouble = EstimateController.calculateEnergyCostsReturnDouble(wattsPerBulb: wattsPerBulb, bulbCount: bulbCount, hoursPerDay: hoursPerDay, pricePerkWh: pricePerkWh, daysPerYear: daysPerYear)
//        
//        if customSC.selectedSegmentIndex == 1 {
//            
//            EstimateController.createScenario(selectedSegmentIndex: 0, bulbType: bulbType, bulbCount: bulbCount, hoursPerDay: hoursPerDay, pricePerkWh: pricePerkWh, daysPerYear: daysPerYear, totalCost: totalcost)
//
//        }
//    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Input View
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func setupInputViewScene() {
        
        inputViewScene.backgroundColor = UIColor.lightGray
//        inputViewScene.alpha = 0.5
        
        self.view.addSubview(inputViewScene)
        
        
        setupInputViewSceneConstraints()
        
        
    }
    
    func setupInputViewSceneConstraints() {
        
        inputViewScene.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: inputViewScene, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: inputViewScene, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -20)
        let bottomConstraint = NSLayoutConstraint(item: inputViewScene, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -20)
        let leadingConstraint = NSLayoutConstraint(item: inputViewScene, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 20)
        
        self.view.addConstraints([topConstraint, trailingConstraint, bottomConstraint, leadingConstraint])
    }
    
    func animateViewAppearing() {
        UIView.animate(withDuration: 0.5, animations: ({
            self.inputViewScene.center.y += -700
        }))
//        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: UIViewAnimationOptions.curveEaseInOut, animations: ({
//        self.inputViewScene.center.y += 600
//        
//        }), completion: nil)
    }
    // Segmented Controller View
    
    func setupSegmentedControllerView() {
        
        segmentedControllerView.backgroundColor = .white
        
        inputViewScene.addSubview(segmentedControllerView)
    }
    // Segmented Controller
    
    func setupSegmentedController() {
        
        customSC.backgroundColor = .white
        customSC.selectedSegmentIndex = 0
//        customSC.addTarget(self, action: #selector(segmentControllerValueChanged), for: .valueChanged)
        
        segmentedControllerView.addSubview(customSC)
    }
    
    // Compare Button
    
    func setupCompareButton() {
        
        compareButton.setTitle("COMPARE", for: .normal)
        compareButton.backgroundColor = UIColor(red: 40/255, green: 120/255, blue: 20/255, alpha: 1)
        compareButton.titleLabel?.font = UIFont(name: "Avenir Next", size: 24)
        compareButton.tintColor = .white
        compareButton.layer.cornerRadius = 15
        compareButton.addTarget(self, action: #selector(compareButtonTapped), for: .touchUpInside)
        
        inputViewScene.addSubview(compareButton)
        
    }
    
    // Bulb Type View
    
    func setupBulbTypeView() {
        
        bulbTypeView.backgroundColor = .white
        
        inputViewScene.addSubview(bulbTypeView)
    }
    
    func setupBulbTypeLabel() {
        
        bulbTypeLabel.backgroundColor = .white
        bulbTypeLabel.font = UIFont(name: "Avenir Next", size: 16)
        bulbTypeLabel.text = "BULB TYPE"
        
        inputViewScene.addSubview(bulbTypeLabel)
        
    }
    
    func setupPickerTextField() {
        
        pickerTextField.inputView = bulbTypePickerView
        pickerTextField.font = UIFont(name: "Avenir Next", size: 14)
        pickerTextField.placeholder = "Select Bulb Size and Type"
        
        bulbTypeView.addSubview(pickerTextField)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let font = UIFontDescriptor(name: "Avenir Next", size: 24)
        pickerLabel.textAlignment = NSTextAlignment.center
        pickerLabel.textColor = UIColor.black
        pickerLabel.text = pickerData[row]
        pickerLabel.font = UIFont(descriptor: font , size: 26)
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let type = pickerData[row]
        switch type {
            
        case "C9 Incandecent":
            self.wattsPerBulb = 7
            pickerTextField.text = type
        case "C9 LED":
            self.wattsPerBulb = 1
            pickerTextField.text = type
        case "C7 Incandecent":
            self.wattsPerBulb = 5
            pickerTextField.text = type
        case "C7 LED":
            self.wattsPerBulb = 0.6
            pickerTextField.text = type
        default:
            let alertController = UIAlertController(title: "Ah oh", message: "Please select the bulb type", preferredStyle: .alert)
            let tryAgainAction = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
            alertController.addAction(tryAgainAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    // Bulb Count View
    
    func setupBulbCountView() {
        
        bulbCountView.backgroundColor = .white
        
        inputViewScene.addSubview(bulbCountView)
    }
    
    func setupBulbCountLabel() {
        
        bulbCountLabel.backgroundColor = .white
        bulbCountLabel.font = UIFont(name: "Avenir Next", size: 16)
        bulbCountLabel.text = "BULB COUNT"
        
        inputViewScene.addSubview(bulbCountLabel)
    }
    
    func setupBulbCountTextField() {
        
        bulbCountTextField.placeholder = "Number of bulbs?"
        bulbCountTextField.font = UIFont(name: "Avenir Next", size: 14)
        bulbCountTextField.keyboardType = .numberPad
        bulbCountView.addSubview(bulbCountTextField)
    }
    
//    func addDoneButtonOnKeyboard()
//    {
//        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
//        doneToolbar.barStyle = UIBarStyle.blackTranslucent
//        
//        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
//        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: (#selector(InitialSceneViewController.doneButtonAction)))
//        
//        var items = [UIBarButtonItem]()
//        items.append(flexSpace)
//        items.append(done)
//        
//        doneToolbar.items = items
//        doneToolbar.sizeToFit()
//        
//        self.bulbCountTextField.inputAccessoryView = doneToolbar
//        
//    }
//    
//    func doneButtonAction() {
//        self.bulbCountTextField.resignFirstResponder()
//    }
    
    // Hours per Day View
    
    func setupHoursPerDayView() {
        
        hoursPerDayView.backgroundColor = .white
        
        inputViewScene.addSubview(hoursPerDayView)
    }
    
    func setupHoursPerDayLabel() {
        
        hoursPerDayLabel.backgroundColor = .white
        hoursPerDayLabel.font = UIFont(name: "Avenir Next", size: 16)
        hoursPerDayLabel.numberOfLines = 0
        hoursPerDayLabel.lineBreakMode = .byWordWrapping
        hoursPerDayLabel.text = "HOURS PER DAY"
        
        inputViewScene.addSubview(hoursPerDayLabel)
    }
    
    func setupHoursPerDayTextField() {
        
        hoursPerDayTextField.placeholder = "Hours running per day?"
        hoursPerDayTextField.font = UIFont(name: "Avenir Next", size: 14)
        hoursPerDayTextField.keyboardType = .numberPad
        hoursPerDayView.addSubview(hoursPerDayTextField)
    }
    
    // Cost Per kWH View
    
    func setupCostPerkWhView() {
        
        costPerkWhView.backgroundColor = .white
        
        inputViewScene.addSubview(costPerkWhView)
    }
    
    func setupCostPerkWhLabel() {
        
        costPerkWhLabel.backgroundColor = .white
        costPerkWhLabel.font = UIFont(name: "Avenir Next", size: 16)
        costPerkWhLabel.text = "COST PER KWH"
        
        inputViewScene.addSubview(costPerkWhLabel)
    }
    
    func setupFixedCostLabel() {
        
        costPerkWhFixedLabel.backgroundColor = .white
        costPerkWhFixedLabel.font = UIFont(name: "Avenir Next", size: 12)
        costPerkWhFixedLabel.text = "$0.11/kWh (average in Utah)"
        
        costPerkWhView.addSubview(costPerkWhFixedLabel)
    }
    
    // Days Running View
    
    func setupDaysRunningView() {
        
        daysRunningView.backgroundColor = .white
        
        inputViewScene.addSubview(daysRunningView)
    }
    
    func setupDaysRunningLabel() {
        
        daysRunningLabel.backgroundColor = .white
        daysRunningLabel.font = UIFont(name: "Avenir Next", size: 16)
        daysRunningLabel.text = "DAYS RUNNING"
        
        daysRunningView.addSubview(daysRunningLabel)
    }
    
    func setupDaysRunningTextField() {
        
        daysRunningTextField.placeholder = "Days running?"
        daysRunningTextField.font = UIFont(name: "Avenir Next", size: 14)
        daysRunningTextField.keyboardType = .numberPad
        daysRunningView.addSubview(daysRunningTextField)
    }
    
    func setupTotalCostView() {
        
        totalCostView.backgroundColor = .white
        
        inputViewScene.addSubview(totalCostView)
    }
    
    func setupTotalCostLabel() {
        
        totalCostLabel.backgroundColor = .white
        totalCostLabel.font = UIFont(name: "Avenir Next", size: 16)
        totalCostLabel.text = "TOTAL COST"
        
        totalCostView.addSubview(totalCostLabel)
    }
    
    func setupTotalCostCalculatedLabel() {
        
        totalCostCalculatedLabel.backgroundColor = .white
        totalCostCalculatedLabel.font = UIFont(name: "Avenir Next", size: 12)
        totalCostCalculatedLabel.text = ""
        
        totalCostView.addSubview(totalCostCalculatedLabel)
    }
    
    func setupCalculateButton() {
        
        calculateButton.setTitle("CALCULATE", for: .normal)
        calculateButton.backgroundColor = UIColor(red: 40/255, green: 120/255, blue: 20/255, alpha: 1)
        calculateButton.titleLabel?.font = UIFont(name: "Avenir Next", size: 24)
        calculateButton.tintColor = .white
        calculateButton.layer.cornerRadius = 15
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        
        inputViewScene.addSubview(calculateButton)
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Component Constraints
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func setupEachComponentContraints() {
        
        segmentedControllerView.translatesAutoresizingMaskIntoConstraints = false
        customSC.translatesAutoresizingMaskIntoConstraints = false
        compareButton.translatesAutoresizingMaskIntoConstraints = false
        bulbTypeView.translatesAutoresizingMaskIntoConstraints = false
        bulbTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        pickerTextField.translatesAutoresizingMaskIntoConstraints = false
        bulbCountView.translatesAutoresizingMaskIntoConstraints = false
        bulbCountLabel.translatesAutoresizingMaskIntoConstraints = false
        bulbCountTextField.translatesAutoresizingMaskIntoConstraints = false
        hoursPerDayView.translatesAutoresizingMaskIntoConstraints = false
        hoursPerDayLabel.translatesAutoresizingMaskIntoConstraints = false
        hoursPerDayTextField.translatesAutoresizingMaskIntoConstraints = false
        costPerkWhView.translatesAutoresizingMaskIntoConstraints = false
        costPerkWhLabel.translatesAutoresizingMaskIntoConstraints = false
        costPerkWhFixedLabel.translatesAutoresizingMaskIntoConstraints = false
        daysRunningView.translatesAutoresizingMaskIntoConstraints = false
        daysRunningLabel.translatesAutoresizingMaskIntoConstraints = false
        daysRunningTextField.translatesAutoresizingMaskIntoConstraints = false
        totalCostView.translatesAutoresizingMaskIntoConstraints = false
        totalCostLabel.translatesAutoresizingMaskIntoConstraints = false
        totalCostCalculatedLabel.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Segmented Controller View Constraints
        
        let segmentedControllerViewTop = NSLayoutConstraint(item: segmentedControllerView, attribute: .top, relatedBy: .equal, toItem: inputViewScene, attribute: .top, multiplier: 1, constant: 6)
        let segmentedControllerViewLeading = NSLayoutConstraint(item: segmentedControllerView, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .leading, multiplier: 1, constant: 6)
        let segmentedControllerViewTrailing = NSLayoutConstraint(item: segmentedControllerView, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .trailing, multiplier: 1, constant: -6)
        let segmentedControllerViewHeight = NSLayoutConstraint(item: segmentedControllerView, attribute: .height, relatedBy: .equal, toItem: inputViewScene, attribute: .height, multiplier: 0, constant: 45)
        
        // Segmented Controller Constraints
        
        let leadingConstraint = NSLayoutConstraint(item: customSC, attribute: .leading, relatedBy: .equal, toItem: segmentedControllerView, attribute: .leading, multiplier: 1, constant: 10)
        let trailingConstraint = NSLayoutConstraint(item: customSC, attribute: .trailing, relatedBy: .equal, toItem: segmentedControllerView, attribute: .trailing, multiplier: 1, constant: -10)
        let topConstraint = NSLayoutConstraint(item: customSC, attribute: .centerY, relatedBy: .equal, toItem: segmentedControllerView, attribute: .centerY, multiplier: 1, constant: 0)
        let customSCHeight = NSLayoutConstraint(item: customSC, attribute: .height, relatedBy: .equal, toItem: segmentedControllerView, attribute: .height, multiplier: 0, constant: 35)
        
        // Compare Button Constraints
        
        let topToCustomSC = NSLayoutConstraint(item: compareButton, attribute: .top, relatedBy: .equal, toItem: customSC, attribute: .bottom, multiplier: 1, constant: 20)
        let leadingFromCenterX = NSLayoutConstraint(item: compareButton, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .centerX, multiplier: 1, constant: -100)
        let trailingFromCenterX = NSLayoutConstraint(item: compareButton, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .centerX, multiplier: 1, constant: 110)
        let compareButtonHeight = NSLayoutConstraint(item: compareButton, attribute: .height, relatedBy: .equal, toItem: inputViewScene, attribute: .height, multiplier: 0, constant: 40)
        
        // Bulb Type View Constraints
        
        let topToCompareButton = NSLayoutConstraint(item: bulbTypeView, attribute: .top, relatedBy: .equal, toItem: compareButton, attribute: .bottom, multiplier: 1, constant: 20)
        let leadingBulbTypeView = NSLayoutConstraint(item: bulbTypeView, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .leading, multiplier: 1, constant: 8)
        let trailingBulbTypeView = NSLayoutConstraint(item: bulbTypeView, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .trailing, multiplier: 1, constant: -8)
        let heightBulbTypeView = NSLayoutConstraint(item: bulbTypeView, attribute: .height, relatedBy: .equal, toItem: inputViewScene, attribute: .height, multiplier: 0, constant: 40)
        
        // Bulb Type Label Constraints
        
        let topToBulbTypeView = NSLayoutConstraint(item: bulbTypeLabel, attribute: .centerY, relatedBy: .equal, toItem: bulbTypeView, attribute: .centerY, multiplier: 1, constant: 0)
        let leadingBulbTypeLabel = NSLayoutConstraint(item: bulbTypeLabel, attribute: .leading, relatedBy: .equal, toItem: bulbTypeView, attribute: .leading, multiplier: 1, constant: 10)
        let trailingBulbTypeLabel = NSLayoutConstraint(item: bulbTypeLabel, attribute: .width, relatedBy: .equal, toItem: bulbTypeView, attribute: .width, multiplier: 0, constant: 140)
        
        // Bulb Type Picker Text Field
        
        let pickerTextFieldCenterY = NSLayoutConstraint(item: pickerTextField, attribute: .centerY, relatedBy: .equal, toItem: bulbTypeView, attribute: .centerY, multiplier: 1, constant: 0)
        let leadingPickerTextField = NSLayoutConstraint(item: pickerTextField, attribute: .leading, relatedBy: .equal, toItem: bulbTypeView, attribute: .leading, multiplier: 1, constant: 170)
        let trailingPickerTextField = NSLayoutConstraint(item: pickerTextField, attribute: .trailing, relatedBy: .equal, toItem: bulbTypeView, attribute: .trailing, multiplier: 1, constant: -10)
        
        // Bulb Count View Constraints
        
        let topToBulbTypeViewBottom = NSLayoutConstraint(item: bulbCountView, attribute: .top, relatedBy: .equal, toItem: bulbTypeView, attribute: .bottom, multiplier: 1, constant: 4)
        let leadingBulbCountView = NSLayoutConstraint(item: bulbCountView, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .leading, multiplier: 1, constant: 8)
        let trailingBulbCountView = NSLayoutConstraint(item: bulbCountView, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .trailing, multiplier: 1, constant: -8)
        let heightBulbCountView = NSLayoutConstraint(item: bulbCountView, attribute: .height, relatedBy: .equal, toItem: inputViewScene, attribute: .height, multiplier: 0, constant: 40)
        
        // Bulb Count Label Constraints
        
        let toTopBulbCountView = NSLayoutConstraint(item: bulbCountLabel, attribute: .centerY, relatedBy: .equal, toItem: bulbCountView, attribute: .centerY, multiplier: 1, constant: 0)
        let leadingBulbCountLabel = NSLayoutConstraint(item: bulbCountLabel, attribute: .leading, relatedBy: .equal, toItem: bulbCountView, attribute: .leading, multiplier: 1, constant: 10)
        let trailingBulbCountLabel = NSLayoutConstraint(item: bulbCountLabel, attribute: .width, relatedBy: .equal, toItem: bulbCountView, attribute: .width, multiplier: 0, constant: 140)
        
        // Bulb Count Text Field
        
        let bulbCountTextFieldCenterY = NSLayoutConstraint(item: bulbCountTextField, attribute: .centerY, relatedBy: .equal, toItem: bulbCountView, attribute: .centerY, multiplier: 1, constant: 0)
        let leadingBulbCountTextField = NSLayoutConstraint(item: bulbCountTextField, attribute: .leading, relatedBy: .equal, toItem: bulbCountView, attribute: .leading, multiplier: 1, constant: 170)
        let trailingBulbCountTextField = NSLayoutConstraint(item: bulbCountTextField, attribute: .trailing, relatedBy: .equal, toItem: bulbCountView, attribute: .trailing, multiplier: 1, constant: -10)
        
        // Hours per Day View Contraints
        
        let topToBulbCountViewBottom = NSLayoutConstraint(item: hoursPerDayView, attribute: .top, relatedBy: .equal, toItem: bulbCountView, attribute: .bottom, multiplier: 1, constant: 4)
        let leadingHoursPerDayView = NSLayoutConstraint(item: hoursPerDayView, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .leading, multiplier: 1, constant: 8)
        let trailingHoursPerDayView = NSLayoutConstraint(item: hoursPerDayView, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .trailing, multiplier: 1, constant: -8)
        let heightHoursPerDayView = NSLayoutConstraint(item: hoursPerDayView, attribute: .height, relatedBy: .equal, toItem: inputViewScene, attribute: .height, multiplier: 0, constant: 40)
        
        // Hours per Day Label Constraints
        
        let toTopHoursPerDayView = NSLayoutConstraint(item: hoursPerDayLabel, attribute: .centerY, relatedBy: .equal, toItem: hoursPerDayView, attribute: .centerY, multiplier: 1, constant: 0)
        let leadingHoursPerDayLabel = NSLayoutConstraint(item: hoursPerDayLabel, attribute: .leading, relatedBy: .equal, toItem: hoursPerDayView, attribute: .leading, multiplier: 1, constant: 10)
        let trailingHoursPerDayLabel = NSLayoutConstraint(item: hoursPerDayLabel, attribute: .width, relatedBy: .equal, toItem: hoursPerDayView, attribute: .width, multiplier: 0, constant: 140)
        
        
        // Hours per Day Text Field Constraints
        
        let hoursPerDayTextFieldCenterY = NSLayoutConstraint(item: hoursPerDayTextField, attribute: .centerY, relatedBy: .equal, toItem: hoursPerDayView, attribute: .centerY, multiplier: 1, constant: 0)
        let leadingHoursPerDayTextField = NSLayoutConstraint(item: hoursPerDayTextField, attribute: .leading, relatedBy: .equal, toItem: hoursPerDayView, attribute: .leading, multiplier: 1, constant: 170)
        let trailingHoursPerDayTextField = NSLayoutConstraint(item: hoursPerDayTextField, attribute: .trailing, relatedBy: .equal, toItem: hoursPerDayView, attribute: .trailing, multiplier: 1, constant: -10)
        
        // Cost per kWh View Constraints
        
        let topToHoursPerDayViewBottom = NSLayoutConstraint(item: costPerkWhView, attribute: .top, relatedBy: .equal, toItem: hoursPerDayView, attribute: .bottom, multiplier: 1, constant: 4)
        let leadingCostPerkWhView = NSLayoutConstraint(item: costPerkWhView, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .leading, multiplier: 1, constant: 8)
        let trailingCostPerkWhView = NSLayoutConstraint(item: costPerkWhView, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .trailing, multiplier: 1, constant: -8)
        let heightCostPerkWhView = NSLayoutConstraint(item: costPerkWhView, attribute: .height, relatedBy: .equal, toItem: inputViewScene, attribute: .height, multiplier: 0, constant: 40)
        
        
        // Cost per kWH Label Constraints
        
        let toTopCostPerkwhView = NSLayoutConstraint(item: costPerkWhLabel, attribute: .centerY, relatedBy: .equal, toItem: costPerkWhView, attribute: .centerY, multiplier: 1, constant: 0)
        let leadingCostPerkWhLabel = NSLayoutConstraint(item: costPerkWhLabel, attribute: .leading, relatedBy: .equal, toItem: costPerkWhView, attribute: .leading, multiplier: 1, constant: 10)
        let trailingCostPerkWhLabel = NSLayoutConstraint(item: costPerkWhLabel, attribute: .width, relatedBy: .equal, toItem: costPerkWhView, attribute: .width, multiplier: 0, constant: 140)
        
        // Cost per kWh Fixed Cost Label Constraints
        
        let toTopCostPerkWhView2 = NSLayoutConstraint(item: costPerkWhFixedLabel, attribute: .centerY, relatedBy: .equal, toItem: costPerkWhView, attribute: .centerY, multiplier: 1, constant: 0)
        let leadingCostPerkWhFixedLabel = NSLayoutConstraint(item: costPerkWhFixedLabel, attribute: .leading, relatedBy: .equal, toItem: costPerkWhView, attribute: .leading, multiplier: 1, constant: 170)
        let trailingCostPerkWhFixedLabel = NSLayoutConstraint(item: costPerkWhFixedLabel, attribute: .trailing, relatedBy: .equal, toItem: costPerkWhView, attribute: .trailing, multiplier: 1, constant: -10)
        
        // Days Running View Constraints
        
        let topToCostPerkWhViewBottom = NSLayoutConstraint(item: daysRunningView, attribute: .top, relatedBy: .equal, toItem: costPerkWhView, attribute: .bottom, multiplier: 1, constant: 4)
        let leadingDaysRunningView = NSLayoutConstraint(item: daysRunningView, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .leading, multiplier: 1, constant: 8)
        let trailingDaysRunningView = NSLayoutConstraint(item: daysRunningView, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .trailing, multiplier: 1, constant: -8)
        let heightDaysRunningView = NSLayoutConstraint(item: daysRunningView, attribute: .height, relatedBy: .equal, toItem: inputViewScene, attribute: .height, multiplier: 0, constant: 40)
        
        // Days Running Label Constraints
        
        let toTopDaysRunningView = NSLayoutConstraint(item: daysRunningLabel, attribute: .centerY, relatedBy: .equal, toItem: daysRunningView, attribute: .centerY, multiplier: 1, constant: 0)
        let leadingDaysRunningLabel = NSLayoutConstraint(item: daysRunningLabel, attribute: .leading, relatedBy: .equal, toItem: daysRunningView, attribute: .leading, multiplier: 1, constant: 10)
        let trailingDaysRunningLabel = NSLayoutConstraint(item: daysRunningLabel, attribute: .width, relatedBy: .equal, toItem: daysRunningView, attribute: .width, multiplier: 0, constant: 140)
        
        // Days Running Text Field Constraints
        
        let daysRunningTextFieldCenterY = NSLayoutConstraint(item: daysRunningTextField, attribute: .centerY, relatedBy: .equal, toItem: daysRunningView, attribute: .centerY, multiplier: 1, constant: 0)
        let leadingDaysRunningTextField = NSLayoutConstraint(item: daysRunningTextField, attribute: .leading, relatedBy: .equal, toItem: daysRunningView, attribute: .leading, multiplier: 1, constant: 170)
        let trailingDaysRunningTextField = NSLayoutConstraint(item: daysRunningTextField, attribute: .trailing, relatedBy: .equal, toItem: daysRunningView, attribute: .trailing, multiplier: 1, constant: -10)
        
        // Total Cost View Constraints
        
        let totalCostViewTop = NSLayoutConstraint(item: totalCostView, attribute: .top, relatedBy: .equal, toItem: daysRunningView, attribute: .bottom, multiplier: 1, constant: 4)
        let totalCostViewLeading = NSLayoutConstraint(item: totalCostView, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .leading, multiplier: 1, constant: 8)
        let totalCostViewTrailing = NSLayoutConstraint(item: totalCostView, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .trailing, multiplier: 1, constant: -8)
        let heightTotalCostView = NSLayoutConstraint(item: totalCostView, attribute: .height, relatedBy: .equal, toItem: inputViewScene, attribute: .height, multiplier: 0, constant: 40)
        
        // Total Cost Label Constraints
        
        let toTopTotalCostView = NSLayoutConstraint(item: totalCostLabel, attribute: .centerY, relatedBy: .equal, toItem: totalCostView, attribute: .centerY, multiplier: 1, constant: 0)
        let totalCostLabelLeading = NSLayoutConstraint(item: totalCostLabel, attribute: .leading, relatedBy: .equal, toItem: totalCostView, attribute: .leading, multiplier: 1, constant: 10)
        let totalCostLabelWidth = NSLayoutConstraint(item: totalCostLabel, attribute: .width, relatedBy: .equal, toItem: totalCostView, attribute: .width, multiplier: 0, constant: 140)
        
        // Total Cost Calculated Label Constraints
        
        let totalCostCalculatedLabelCenterY = NSLayoutConstraint(item: totalCostCalculatedLabel, attribute: .centerY, relatedBy: .equal, toItem: totalCostView, attribute: .centerY, multiplier: 1, constant: 0)
        let totalCostCalculatedLabelLeading = NSLayoutConstraint(item: totalCostCalculatedLabel , attribute: .leading, relatedBy: .equal, toItem: totalCostView, attribute: .leading, multiplier: 1, constant: 170)
        let totalCostCalculatedLabelTrailing = NSLayoutConstraint(item: totalCostCalculatedLabel, attribute: .trailing, relatedBy: .equal, toItem: totalCostView, attribute: .trailing, multiplier: 1, constant: -10)
        
        // Calculate Button Constraints
        
        let calculateButtonTop = NSLayoutConstraint(item: calculateButton, attribute: .top, relatedBy: .equal, toItem: totalCostView, attribute: .bottom, multiplier: 1, constant: 20)
        let calculateButtonLeading = NSLayoutConstraint(item: calculateButton, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .leading, multiplier: 1, constant: 50)
        let calculateButtonTrailing = NSLayoutConstraint(item: calculateButton, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .trailing, multiplier: 1, constant: -50)
        let calculateButtonHeight = NSLayoutConstraint(item: calculateButton, attribute: .height, relatedBy: .equal, toItem: inputViewScene, attribute: .height, multiplier: 0, constant: 40)
        
        // Add all costraints to Input View Scene
        
        inputViewScene.addConstraints([segmentedControllerViewTop, segmentedControllerViewLeading, segmentedControllerViewTrailing, segmentedControllerViewHeight, leadingConstraint, trailingConstraint, topConstraint, customSCHeight, topToCustomSC, leadingFromCenterX, trailingFromCenterX, compareButtonHeight, topToCompareButton, leadingBulbTypeView, trailingBulbTypeView, heightBulbTypeView, topToBulbTypeView, leadingBulbTypeLabel, trailingBulbTypeLabel, pickerTextFieldCenterY, leadingPickerTextField, trailingPickerTextField, topToBulbTypeViewBottom, leadingBulbCountView, trailingBulbCountView, heightBulbCountView, toTopBulbCountView, leadingBulbCountLabel, trailingBulbCountLabel, bulbCountTextFieldCenterY, leadingBulbCountTextField, trailingBulbCountTextField, topToBulbCountViewBottom, leadingHoursPerDayView, trailingHoursPerDayView, heightHoursPerDayView, toTopHoursPerDayView, leadingHoursPerDayLabel, trailingHoursPerDayLabel, hoursPerDayTextFieldCenterY, leadingHoursPerDayTextField, trailingHoursPerDayTextField, topToHoursPerDayViewBottom, leadingCostPerkWhView, trailingCostPerkWhView, heightCostPerkWhView, toTopCostPerkwhView, leadingCostPerkWhLabel, trailingCostPerkWhLabel, toTopCostPerkWhView2, leadingCostPerkWhFixedLabel, trailingCostPerkWhFixedLabel, topToCostPerkWhViewBottom, leadingDaysRunningView, trailingDaysRunningView, heightDaysRunningView, toTopDaysRunningView, leadingDaysRunningLabel, trailingDaysRunningLabel, daysRunningTextFieldCenterY, leadingDaysRunningTextField, trailingDaysRunningTextField, totalCostViewTop, totalCostViewLeading, totalCostViewTrailing, heightTotalCostView, toTopTotalCostView, totalCostLabelLeading, totalCostLabelWidth, totalCostCalculatedLabelCenterY, totalCostCalculatedLabelLeading, totalCostCalculatedLabelTrailing, calculateButtonTop, calculateButtonLeading, calculateButtonTrailing, calculateButtonHeight])
    }
    
}





