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
    
    var instructionsLabel = UILabel()
    
    var bulbCountView = UIView()
    var bulbCountLabel = UILabel()
    var bulbCountTextField = UITextField()
    
    var hoursPerDayView = UIView()
    var hoursPerDayLabel = UILabel()
    var hoursPerDayTextField = UITextField()
    
    var costPerkWhView = UIView()
    var costPerkWhLabel = UILabel()
    let pricePerkWh = 0.12
    var costPerkWhFixedLabel = UILabel()
    
    var daysRunningView = UIView()
    var daysRunningLabel = UILabel()
    var daysRunningTextField = UITextField()
    
    var calculateButton = UIButton()
    
    var c9IncandecentView = UIView()
    var c9IncandecentLabel = UILabel()
    var c9IncandecentCostLabel = UILabel()
    
    var c9LedView = UIView()
    var c9LedLabel = UILabel()
    var c9LedCostLabel = UILabel()
    
    var c7IncandecentView = UIView()
    var c7IncandecentLabel = UILabel()
    var c7IncandecentCostLabel = UILabel()
    
    var c7LedView = UIView()
    var c7LedLabel = UILabel()
    var c7LedCostLabel = UILabel()
    
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
        
        hideKeyboardWhenViewIsTapped()

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
        setupInstructionsLabel()
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
        setupC9IncandecentView()
        setupC9IncandecentLabel()
        setupC9IncandecentCostLabel()
        setupC9LedView()
        setupC9LedLabel()
        setupC9LedCostLabel()
        setupC7IncandecentView()
        setupC7IncandecentLabel()
        setupC7IncandecentCostLabel()
        setupC7LedView()
        setupC7LedLabel()
        setupC7LedCostLabel()
        
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
        
        dismissKeyboard()
        
        guard let bulbCountText = bulbCountTextField.text,
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
        
        let c9IncandescentCost = EstimateController.calculateEnergyCosts(wattsPerBulb: 7.0, bulbCount: bulbCount, hoursPerDay: hoursPerDay, pricePerkWh: pricePerkWh, daysPerYear: daysPerYear)
        let c9LedCost = EstimateController.calculateEnergyCosts(wattsPerBulb: 1.0, bulbCount: bulbCount, hoursPerDay: hoursPerDay, pricePerkWh: pricePerkWh, daysPerYear: daysPerYear)
        let c7IncandescentCost = EstimateController.calculateEnergyCosts(wattsPerBulb: 5.0, bulbCount: bulbCount, hoursPerDay: hoursPerDay, pricePerkWh: pricePerkWh, daysPerYear: daysPerYear)
        let c7LedCost = EstimateController.calculateEnergyCosts(wattsPerBulb: 0.6, bulbCount: bulbCount, hoursPerDay: hoursPerDay, pricePerkWh: pricePerkWh, daysPerYear: daysPerYear)
        
        c9IncandecentCostLabel.text = c9IncandescentCost
        c9LedCostLabel.text = c9LedCost
        c7IncandecentCostLabel.text = c7IncandescentCost
        c7LedCostLabel.text = c7LedCost
        
        
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
        
        instructionsLabel.text = "Answer the following questions to see the electricity cost for several types of lights:"
        instructionsLabel.font = UIFont(name: "Avenir Next", size: 20)
        instructionsLabel.lineBreakMode = .byWordWrapping
        instructionsLabel.numberOfLines = 0
        instructionsLabel.textAlignment = .center
        
        inputViewScene.addSubview(instructionsLabel)
        
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
        costPerkWhFixedLabel.text = "$0.12/kWh (National Average)"
        
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
    
    // C9 Incandecent View
    
    func setupC9IncandecentView() {
        
        c9IncandecentView.backgroundColor = .white
        
        inputViewScene.addSubview(c9IncandecentView)
        
    }
    
    
    // C9 Incandecent Label
    
    func setupC9IncandecentLabel() {
        
        c9IncandecentLabel.font = UIFont(name: "Avenir Next", size: 16)
        c9IncandecentLabel.text = "C9 Incandescent:"
        c9IncandecentLabel.textAlignment = .center
        
        c9IncandecentView.addSubview(c9IncandecentLabel)
    }
    
    // C9 Incandecent Cost
    
    func setupC9IncandecentCostLabel() {
        
        c9IncandecentCostLabel.font = UIFont(name: "Avenir Next", size: 18)
        c9IncandecentCostLabel.text = "Test"
        c9IncandecentCostLabel.textAlignment = .center
        
        
        c9IncandecentView.addSubview(c9IncandecentCostLabel)
    }
    
    // C9 Led View
    
    func setupC9LedView() {
        
        c9LedView.backgroundColor = .white
        
        inputViewScene.addSubview(c9LedView)
        
    }
    
    // C9 Led Label
    
    func setupC9LedLabel() {
        
        c9LedLabel.text = "C9 LED:"
        c9LedLabel.font = UIFont(name: "Avenir Next", size: 16)
        c9LedLabel.textAlignment = .center
        
        c9LedView.addSubview(c9LedLabel)
    }
    
    // C9 Led Cost
    
    func setupC9LedCostLabel() {
    
        c9LedCostLabel.text = "Test"
        c9LedCostLabel.font = UIFont(name: "Avenir Next", size: 18)
        c9LedCostLabel.textAlignment = .center

        c9LedView.addSubview(c9LedCostLabel)
    }
    
    // C7 Incandecent View
    
    func setupC7IncandecentView() {
        
        c7IncandecentView.backgroundColor = .white
        
        inputViewScene.addSubview(c7IncandecentView)
    }
    
    // C7 Incandecent Label
    
    func setupC7IncandecentLabel() {
        
        c7IncandecentLabel.text = "C7 Incandescent:"
        c7IncandecentLabel.font = UIFont(name: "Avenir Next", size: 16)
        c7IncandecentLabel.textAlignment = .center
        
        c7IncandecentView.addSubview(c7IncandecentLabel)
    }
    
    // C7 Incandecent Cost
    
    func setupC7IncandecentCostLabel() {
        
        c7IncandecentCostLabel.text = "Test"
        c7IncandecentCostLabel.font = UIFont(name: "Avenir Next", size: 18)
        c7IncandecentCostLabel.textAlignment = .center
        
        c7IncandecentView.addSubview(c7IncandecentCostLabel)
    }
    
    // C7 Led View
    
    func setupC7LedView() {
        
        c7LedView.backgroundColor = .white
        
        inputViewScene.addSubview(c7LedView)
        
    }
    
    // C7 Led Label
    
    func setupC7LedLabel() {
        
        c7LedLabel.text = "C7 LED:"
        c7LedLabel.font = UIFont(name: "Avenir Next", size: 16)
        c7LedLabel.textAlignment = .center
        
        c7LedView.addSubview(c7LedLabel)
    }
    
    // C7 Led Cost
    
    func setupC7LedCostLabel() {
        
        c7LedCostLabel.textAlignment = .center
        c7LedCostLabel.text = "Test"
        c7LedCostLabel.font = UIFont(name: "Avenir Next", size: 18)
        
        c7LedView.addSubview(c7LedCostLabel)
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Component Constraints
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func setupEachComponentContraints() {
        
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
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
        c9IncandecentView.translatesAutoresizingMaskIntoConstraints = false
        c9IncandecentLabel.translatesAutoresizingMaskIntoConstraints = false
        c9IncandecentCostLabel.translatesAutoresizingMaskIntoConstraints = false
        c9LedView.translatesAutoresizingMaskIntoConstraints = false
        c9LedLabel.translatesAutoresizingMaskIntoConstraints = false
        c9LedCostLabel.translatesAutoresizingMaskIntoConstraints = false
        c7IncandecentView.translatesAutoresizingMaskIntoConstraints = false
        c7IncandecentLabel.translatesAutoresizingMaskIntoConstraints = false
        c7IncandecentCostLabel.translatesAutoresizingMaskIntoConstraints = false
        c7LedView.translatesAutoresizingMaskIntoConstraints = false
        c7LedLabel.translatesAutoresizingMaskIntoConstraints = false
        c7LedCostLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Instructions Label Constraints
        
        let instructionsLabelTop = NSLayoutConstraint(item: instructionsLabel, attribute: .top, relatedBy: .equal, toItem: inputViewScene, attribute: .top, multiplier: 1, constant: 25)
        let instructionsLabelLeading = NSLayoutConstraint(item: instructionsLabel, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .leading, multiplier: 1, constant: 30)
        let instructionsLabelTrailing = NSLayoutConstraint(item: instructionsLabel, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .trailing, multiplier: 1, constant: -30)
        
        // Bulb Count View Constraints
        
        let topToBulbTypeViewBottom = NSLayoutConstraint(item: bulbCountView, attribute: .top, relatedBy: .equal, toItem: inputViewScene, attribute: .top, multiplier: 1, constant: 130)
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
        
        // C9 Incandecent View Constraints
    
        let c9IncandecentViewBottom = NSLayoutConstraint(item: c9IncandecentView, attribute: .bottom, relatedBy: .equal, toItem: c7IncandecentView, attribute: .top, multiplier: 1, constant: -16)
        let c9IncandecentViewLeading = NSLayoutConstraint(item: c9IncandecentView, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .leading, multiplier: 1, constant: 15)
        let c9IncandecentViewTrailing = NSLayoutConstraint(item: c9IncandecentView, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .centerX, multiplier: 1, constant: -8)
        let c9IncandecentViewTop = NSLayoutConstraint(item: c9IncandecentView, attribute: .top, relatedBy: .equal, toItem: calculateButton, attribute: .bottom, multiplier: 1, constant: 15)
        
        // C9 Incandecent Label Constraints
        
        let c9IncandecentLabelLeading = NSLayoutConstraint(item: c9IncandecentLabel, attribute: .leading, relatedBy: .equal, toItem: c9IncandecentView, attribute: .leading, multiplier: 1, constant: 0)
        let c9IncandecentLabelTrailing = NSLayoutConstraint(item: c9IncandecentLabel, attribute: .trailing, relatedBy: .equal, toItem: c9IncandecentView, attribute: .trailing, multiplier: 1, constant: 0)
        let c9IncandecentLabelBottom = NSLayoutConstraint(item: c9IncandecentLabel, attribute: .bottom, relatedBy: .equal, toItem: c9IncandecentView, attribute: .centerY, multiplier: 1, constant: 0)
        let c9IncandecentLabelTop = NSLayoutConstraint(item: c9IncandecentLabel, attribute: .top, relatedBy: .equal, toItem: c9IncandecentView, attribute: .top, multiplier: 1, constant: 0)
        
        // C9 Incandecent Cost Constraints
        
        let c9IncandecentCostLeading = NSLayoutConstraint(item: c9IncandecentCostLabel, attribute: .leading, relatedBy: .equal, toItem: c9IncandecentView, attribute: .leading, multiplier: 1, constant: 0)
        let c9IncandecentCostTrailing = NSLayoutConstraint(item: c9IncandecentCostLabel, attribute: .trailing, relatedBy: .equal, toItem: c9IncandecentView, attribute: .trailing, multiplier: 1, constant: 0)
        let c9IncandecentCostBottom = NSLayoutConstraint(item: c9IncandecentCostLabel, attribute: .bottom, relatedBy: .equal, toItem: c9IncandecentView, attribute: .bottom, multiplier: 1, constant: 0)
        let c9IncandecentCostTop = NSLayoutConstraint(item: c9IncandecentCostLabel, attribute: .top, relatedBy: .equal, toItem: c9IncandecentView, attribute: .centerY, multiplier: 1, constant: 0)
        
        // C9 Led View Constraints
        
        let c9LedViewBottom = NSLayoutConstraint(item: c9LedView, attribute: .bottom, relatedBy: .equal, toItem: c7LedView, attribute: .top, multiplier: 1, constant: -16)
        let c9LedViewLeading = NSLayoutConstraint(item: c9LedView, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .centerX, multiplier: 1, constant: 8)
        let c9LedViewTrailing = NSLayoutConstraint(item: c9LedView, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .trailing, multiplier: 1, constant: -15)
        let c9LedViewTop = NSLayoutConstraint(item: c9LedView, attribute: .top, relatedBy: .equal, toItem: calculateButton, attribute: .bottom, multiplier: 1, constant: 15)
        
        // C9 Led Label Constraints
        
        let c9LedLabelLeading = NSLayoutConstraint(item: c9LedLabel, attribute: .leading, relatedBy: .equal, toItem: c9LedView, attribute: .leading, multiplier: 1, constant: 0)
        let c9LedLabelTrailing = NSLayoutConstraint(item: c9LedLabel, attribute: .trailing, relatedBy: .equal, toItem: c9LedView, attribute: .trailing, multiplier: 1, constant: 0)
        let c9LedLabelBottom = NSLayoutConstraint(item: c9LedLabel, attribute: .bottom, relatedBy: .equal, toItem: c9LedView, attribute: .centerY, multiplier: 1, constant: 0)
        let c9LedLabelTop = NSLayoutConstraint(item: c9LedLabel, attribute: .top, relatedBy: .equal, toItem: c9LedView, attribute: .top, multiplier: 1, constant: 0)
        
        // C9 Led Cost Constraints
        
        let c9LedCostLeading = NSLayoutConstraint(item: c9LedCostLabel, attribute: .leading, relatedBy: .equal, toItem: c9LedView, attribute: .leading, multiplier: 1, constant: 0)
        let c9LedCostTrailing = NSLayoutConstraint(item: c9LedCostLabel, attribute: .trailing, relatedBy: .equal, toItem: c9LedView, attribute: .trailing, multiplier: 1, constant: 0)
        let c9LedCostBottom = NSLayoutConstraint(item: c9LedCostLabel, attribute: .bottom, relatedBy: .equal, toItem: c9LedView, attribute: .bottom, multiplier: 1, constant: 0)
        let c9LedCostTop = NSLayoutConstraint(item: c9LedCostLabel, attribute: .top, relatedBy: .equal, toItem: c9LedView, attribute: .centerY, multiplier: 1, constant: 0)
        
        // C7 Incandecent View Constraints
        
        let c7IncandecentViewBottom = NSLayoutConstraint(item: c7IncandecentView, attribute: .bottom, relatedBy: .equal, toItem: inputViewScene, attribute: .bottom, multiplier: 1, constant: -15)
        let c7IncandecentViewLeading = NSLayoutConstraint(item: c7IncandecentView, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .leading, multiplier: 1, constant: 15)
        let c7IncandecentViewTrailing = NSLayoutConstraint(item: c7IncandecentView, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .centerX, multiplier: 1, constant: -8)
        let c7IncandecentViewHeight = NSLayoutConstraint(item: c7IncandecentView, attribute: .height, relatedBy: .equal, toItem: inputViewScene, attribute: .height, multiplier: 0, constant: 150)
        
        // C7 Incandecent Label Constraints
        
        let c7IncandecentLabelLeading = NSLayoutConstraint(item: c7IncandecentLabel, attribute: .leading, relatedBy: .equal, toItem: c7IncandecentView, attribute: .leading, multiplier: 1, constant: 0)
        let c7IncandecentLabelTrailing = NSLayoutConstraint(item: c7IncandecentLabel, attribute: .trailing, relatedBy: .equal, toItem: c7IncandecentView, attribute: .trailing, multiplier: 1, constant: 0)
        let c7IncandecentLabelBottom = NSLayoutConstraint(item: c7IncandecentLabel, attribute: .bottom, relatedBy: .equal, toItem: c7IncandecentView, attribute: .centerY, multiplier: 1, constant: 0)
        let c7IncandecentLabelTop = NSLayoutConstraint(item: c7IncandecentLabel, attribute: .top, relatedBy: .equal, toItem: c7IncandecentView, attribute: .top, multiplier: 1, constant: 0)
        
        // C7 Incandecent Cost Constraints
        
        let c7IncandecentCostLeading = NSLayoutConstraint(item: c7IncandecentCostLabel, attribute: .leading, relatedBy: .equal, toItem: c7IncandecentView, attribute: .leading, multiplier: 1, constant: 0)
        let c7IncandecentCostTrailing = NSLayoutConstraint(item: c7IncandecentCostLabel, attribute: .trailing, relatedBy: .equal, toItem: c7IncandecentView, attribute: .trailing, multiplier: 1, constant: 0)
        let c7IncandecentCostBottom = NSLayoutConstraint(item: c7IncandecentCostLabel, attribute: .bottom, relatedBy: .equal, toItem: c7IncandecentView, attribute: .bottom, multiplier: 1, constant: 0)
        let c7IncandecentCostTop = NSLayoutConstraint(item: c7IncandecentCostLabel, attribute: .top, relatedBy: .equal, toItem: c7IncandecentView, attribute: .centerY, multiplier: 1, constant: 0)
        
        // C7 Led View Constraints
        
        let c7LedViewBottom = NSLayoutConstraint(item: c7LedView, attribute: .bottom, relatedBy: .equal, toItem: inputViewScene, attribute: .bottom, multiplier: 1, constant: -15)
        let c7LedViewTrailing = NSLayoutConstraint(item: c7LedView, attribute: .trailing, relatedBy: .equal, toItem: inputViewScene, attribute: .trailing, multiplier: 1, constant: -15)
        let c7LedViewLeading = NSLayoutConstraint(item: c7LedView, attribute: .leading, relatedBy: .equal, toItem: inputViewScene, attribute: .centerX, multiplier: 1, constant: 8)
        let c7LedViewHeight = NSLayoutConstraint(item: c7LedView, attribute: .height, relatedBy: .equal, toItem: inputViewScene, attribute: .height, multiplier: 0, constant: 150)
        
        // C7 Led Label Constraints
        
        let c7LedLabelLeading = NSLayoutConstraint(item: c7LedLabel, attribute: .leading, relatedBy: .equal, toItem: c7LedView, attribute: .leading, multiplier: 1, constant: 0)
        let c7LedLabelTrailing = NSLayoutConstraint(item: c7LedLabel, attribute: .trailing, relatedBy: .equal, toItem: c7LedView, attribute: .trailing, multiplier: 1, constant: 0)
        let c7LedLabelBottom = NSLayoutConstraint(item: c7LedLabel, attribute: .bottom, relatedBy: .equal, toItem: c7LedView, attribute: .centerY, multiplier: 1, constant: 0)
        let c7LedLabelTop = NSLayoutConstraint(item: c7LedLabel, attribute: .top, relatedBy: .equal, toItem: c7LedView, attribute: .top, multiplier: 1, constant: 0)
        
        // C7 Led Cost Constraints
        
        let c7LedCostLeading = NSLayoutConstraint(item: c7LedCostLabel, attribute: .leading, relatedBy: .equal, toItem: c7LedView, attribute: .leading, multiplier: 1, constant: 0)
        let c7LedCostTrailing = NSLayoutConstraint(item: c7LedCostLabel, attribute: .trailing, relatedBy: .equal, toItem: c7LedView, attribute: .trailing, multiplier: 1, constant: 0)
        let c7LedCostBottom = NSLayoutConstraint(item: c7LedCostLabel, attribute: .bottom, relatedBy: .equal, toItem: c7LedView, attribute: .bottom, multiplier: 1, constant: 0)
        let c7LedCostTop = NSLayoutConstraint(item: c7LedCostLabel, attribute: .top, relatedBy: .equal, toItem: c7LedView, attribute: .centerY, multiplier: 1, constant: 0)
        
        // Add all costraints to Input View Scene
        
        inputViewScene.addConstraints([instructionsLabelTop, instructionsLabelLeading, instructionsLabelTrailing, topToBulbTypeViewBottom, leadingBulbCountView, trailingBulbCountView, heightBulbCountView, toTopBulbCountView, leadingBulbCountLabel, trailingBulbCountLabel, bulbCountTextFieldCenterY, leadingBulbCountTextField, trailingBulbCountTextField, topToBulbCountViewBottom, leadingHoursPerDayView, trailingHoursPerDayView, heightHoursPerDayView, toTopHoursPerDayView, leadingHoursPerDayLabel, trailingHoursPerDayLabel, hoursPerDayTextFieldCenterY, leadingHoursPerDayTextField, trailingHoursPerDayTextField, topToHoursPerDayViewBottom, leadingCostPerkWhView, trailingCostPerkWhView, heightCostPerkWhView, toTopCostPerkwhView, leadingCostPerkWhLabel, trailingCostPerkWhLabel, toTopCostPerkWhView2, leadingCostPerkWhFixedLabel, trailingCostPerkWhFixedLabel, topToCostPerkWhViewBottom, leadingDaysRunningView, trailingDaysRunningView, heightDaysRunningView, toTopDaysRunningView, leadingDaysRunningLabel, trailingDaysRunningLabel, daysRunningTextFieldCenterY, leadingDaysRunningTextField, trailingDaysRunningTextField, calculateButtonTop, calculateButtonLeading, calculateButtonTrailing, calculateButtonHeight,   c7IncandecentViewBottom, c7IncandecentViewLeading, c7IncandecentViewTrailing, c7IncandecentViewHeight, c7LedViewBottom, c7LedViewTrailing, c7LedViewLeading, c7LedViewHeight, c9IncandecentViewTop, c9IncandecentViewBottom, c9IncandecentViewLeading, c9IncandecentViewTrailing, c9LedViewTop, c9LedViewBottom, c9LedViewLeading, c9LedViewTrailing, c9IncandecentLabelBottom, c9IncandecentLabelLeading, c9IncandecentLabelTrailing, c9IncandecentLabelTop, c9IncandecentCostTop, c9IncandecentCostBottom, c9IncandecentCostLeading, c9IncandecentCostTrailing, c9LedLabelTop, c9LedLabelBottom, c9LedLabelTrailing, c9LedLabelLeading, c9LedCostTop, c9LedCostBottom, c9LedCostLeading, c9LedCostTrailing, c7IncandecentLabelTop, c7IncandecentLabelBottom, c7IncandecentLabelLeading, c7IncandecentLabelTrailing, c7LedLabelTop, c7LedLabelBottom, c7LedLabelLeading, c7LedLabelTrailing, c7IncandecentCostTop, c7IncandecentCostBottom, c7IncandecentCostLeading, c7IncandecentCostTrailing, c7LedCostLeading, c7LedCostTrailing, c7LedCostTop, c7LedCostBottom])
    }
    
}

extension InitialSceneViewController {
    func hideKeyboardWhenViewIsTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(InitialSceneViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}




