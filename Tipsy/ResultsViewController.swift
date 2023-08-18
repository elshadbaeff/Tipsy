//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Elshad Babaev on 15.08.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let settingsLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = .systemFont(ofSize: 25)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalPerPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Per Person"
        label.textColor = .black
        label.font = .systemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.setTitleColor(UIColor(red: 248/255, green: 255/255, blue: 253/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1)
        button.setTitle("Recalculate", for: .normal)
        button.addTarget(self, action: #selector(recalculatePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupUI()
        setupConstraints()

    }
    
    func setup() {
        view.backgroundColor = .systemCyan
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    
    func setupUI() {
        view.addSubview(totalPerPersonLabel)
        view.addSubview(totalLabel)
        view.addSubview(settingsLabel)
        view.addSubview(recalculateButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        totalPerPersonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        totalPerPersonLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        
        totalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        totalLabel.topAnchor.constraint(equalTo: totalPerPersonLabel.bottomAnchor, constant: 40),
        
        settingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        settingsLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 60),
        settingsLabel.heightAnchor.constraint(equalToConstant: 150),
        
        recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        recalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
        
    }
    
    
    @objc func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
