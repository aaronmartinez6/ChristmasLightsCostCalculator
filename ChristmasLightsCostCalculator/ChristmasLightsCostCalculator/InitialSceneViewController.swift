//
//  InitialSceneViewController.swift
//  ChristmasLightsCostCalculator
//
//  Created by Aaron Martinez on 11/14/16.
//  Copyright © 2016 Aaron Martinez. All rights reserved.
//

import UIKit

class InitialSceneViewController: UIViewController {

    // MARK: - Properties
    
    var letsFindOutButton = UIButton()
    var gradientLayer: CAGradientLayer?
    var howMuchLabel = UILabel()
    
    var inputViewScene = UIView()
    
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
        
        setupInitialLabel()
        setupInitialLabelContraints()

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
    
    func setupInitialLabel() {
    
        howMuchLabel.text = "How much will it cost to run my Christmas Lights?"
        howMuchLabel.numberOfLines = 0
        howMuchLabel.lineBreakMode = .byWordWrapping
        howMuchLabel.textAlignment = .center
        howMuchLabel.font = UIFont(name: "Georgia", size: 26)
        howMuchLabel.textColor = .white
        
        self.view.addSubview(howMuchLabel)
        
    }
    
    func setupInitialLabelContraints() {
    
        howMuchLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let labelTop = NSLayoutConstraint(item: howMuchLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 40)
        let labelLeading = NSLayoutConstraint(item: howMuchLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 40)
        let labelTrailing = NSLayoutConstraint(item: howMuchLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -40)
        
        self.view.addConstraints([labelTop, labelLeading, labelTrailing])
    }
    
}


extension InitialSceneViewController {
    
    func calculateButtonTapped() {
        
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
//            return }
//        
//        let totalCostString = EstimateController.calculateEnergyCosts(wattsPerBulb: wattsPerBulb, bulbCount: bulbCount, hoursPerDay: hoursPerDay, pricePerkWh: pricePerkWh, daysPerYear: daysPerYear)
//        
//        totalCostCalculatedLabel.text = totalCostString
        
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Input View
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func setupInputViewScene() {
        
        inputViewScene.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
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
    
    // Instructions Label
    
    func setupInstructionsLabel() {
        
        
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
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Bulb Count View Constraints
        
        let topToBulbTypeViewBottom = NSLayoutConstraint(item: bulbCountView, attribute: .top, relatedBy: .equal, toItem: inputViewScene, attribute: .top, multiplier: 1, constant: 100)
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
        
        // Calculate Button Constraints
        
        let calculateButtonTop = NSLayoutConstraint(item: calculateButton, attribute: .top, relatedBy: .equal, toItem: daysRunningView, attribute: .bottom, multiplier: 1, constant: 20)
        let calculateButtonLeading = NSLayoutConstraint(item: calculateButton, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .leading, multiplier: 1, constant: 50)
        let calculateButtonTrailing = NSLayoutConstraint(item: calculateButton, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .trailing, multiplier: 1, constant: -50)
        let calculateButtonHeight = NSLayoutConstraint(item: calculateButton, attribute: .height, relatedBy: .equal, toItem: inputViewScene, attribute: .height, multiplier: 0, constant: 40)
        
        // Add all costraints to Input View Scene
        
        inputViewScene.addConstraints([topToBulbTypeViewBottom, leadingBulbCountView, trailingBulbCountView, heightBulbCountView, toTopBulbCountView, leadingBulbCountLabel, trailingBulbCountLabel, bulbCountTextFieldCenterY, leadingBulbCountTextField, trailingBulbCountTextField, topToBulbCountViewBottom, leadingHoursPerDayView, trailingHoursPerDayView, heightHoursPerDayView, toTopHoursPerDayView, leadingHoursPerDayLabel, trailingHoursPerDayLabel, hoursPerDayTextFieldCenterY, leadingHoursPerDayTextField, trailingHoursPerDayTextField, topToHoursPerDayViewBottom, leadingCostPerkWhView, trailingCostPerkWhView, heightCostPerkWhView, toTopCostPerkwhView, leadingCostPerkWhLabel, trailingCostPerkWhLabel, toTopCostPerkWhView2, leadingCostPerkWhFixedLabel, trailingCostPerkWhFixedLabel, topToCostPerkWhViewBottom, leadingDaysRunningView, trailingDaysRunningView, heightDaysRunningView, toTopDaysRunningView, leadingDaysRunningLabel, trailingDaysRunningLabel, daysRunningTextFieldCenterY, leadingDaysRunningTextField, trailingDaysRunningTextField, calculateButtonTop, calculateButtonLeading, calculateButtonTrailing, calculateButtonHeight])
    }
    
}





