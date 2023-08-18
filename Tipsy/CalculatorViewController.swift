//
//  ViewController.swift
//  Tipsy
//
//  Created by Elshad Babaev on 15.08.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.setTitleColor(UIColor(red: 248/255, green: 255/255, blue: 253/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1)
        button.setTitle("Calculate", for: .normal)
        button.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let zeroPctButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 36)
        button.setTitle("0%", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tenPctButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 36)
        button.setTitle("10%", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let twentyPctButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 36)
        button.setTitle("20%", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stepperSplit: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 2
        stepper.maximumValue = 25
        stepper.value = 2
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .touchUpInside)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    let billTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .darkGray
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 40)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let splitHandlerLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Split"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let billHandlerLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter Bill Total"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tipHandlerLabel: UILabel = {
        let label = UILabel()
        label.text = "Select your tip"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let splitNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = .black
        label.font = .systemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    
        constraints()
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            billTextField.topAnchor.constraint(equalTo: view.topAnchor),
            billTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -650),
            billTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            billTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            billTextField.heightAnchor.constraint(equalToConstant: 20),
            
            billHandlerLabel.topAnchor.constraint(equalTo: billTextField.topAnchor, constant: -80),
            billHandlerLabel.bottomAnchor.constraint(equalTo: billTextField.bottomAnchor),
            billHandlerLabel.leadingAnchor.constraint(equalTo: billTextField.leadingAnchor, constant: 20),
            
            tipHandlerLabel.topAnchor.constraint(equalTo: billTextField.bottomAnchor, constant: 20),
            tipHandlerLabel.leadingAnchor.constraint(equalTo: billTextField.leadingAnchor, constant: 20),
            
            zeroPctButton.topAnchor.constraint(equalTo: tipHandlerLabel.bottomAnchor, constant: 10),
            zeroPctButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            zeroPctButton.widthAnchor.constraint(equalToConstant: 80),
            
            tenPctButton.topAnchor.constraint(equalTo: tipHandlerLabel.bottomAnchor, constant: 10),
            tenPctButton.leadingAnchor.constraint(equalTo: zeroPctButton.trailingAnchor, constant: 30),
            tenPctButton.widthAnchor.constraint(equalToConstant: 80),
            
            twentyPctButton.topAnchor.constraint(equalTo: tipHandlerLabel.bottomAnchor, constant: 10),
            twentyPctButton.leadingAnchor.constraint(equalTo: tenPctButton.trailingAnchor, constant: 30),
            twentyPctButton.widthAnchor.constraint(equalToConstant: 80),
            
            splitHandlerLabel.topAnchor.constraint(equalTo: zeroPctButton.bottomAnchor, constant: 35),
            splitHandlerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            splitNumberLabel.topAnchor.constraint(equalTo: splitHandlerLabel.bottomAnchor, constant: 30),
            splitNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            
            stepperSplit.topAnchor.constraint(equalTo: splitHandlerLabel.bottomAnchor, constant: 35),
            stepperSplit.leadingAnchor.constraint(equalTo: splitNumberLabel.leadingAnchor, constant: 50),
            
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)


            
            
            
            
        
        
        
        
        ])
    }
    
    func setupUI() {
        view.backgroundColor = .systemCyan
        view.addSubview(billTextField)
        view.addSubview(billHandlerLabel)
        view.addSubview(tipHandlerLabel)
        view.addSubview(zeroPctButton)
        view.addSubview(tenPctButton)
        view.addSubview(twentyPctButton)
        view.addSubview(splitHandlerLabel)
        view.addSubview(splitNumberLabel)
        view.addSubview(stepperSplit)
        view.addSubview(calculateButton)
    }
    
    @objc func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100

    }
    
    @objc func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @objc func calculatePressed(_ sender: UIButton) {
        
        let vc = ResultsViewController()
        
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        vc.result = finalResult
        vc.tip = Int(tip * 100)
        vc.split = numberOfPeople
        present(vc, animated: true)
    }
}




