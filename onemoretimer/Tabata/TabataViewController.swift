//
//  TabataViewController.swift
//  onemoretimer
//
//  Created by jonghan on 2021/02/24.
//

import UIKit
import SimpleAlertPickers

class TabataViewController: UIViewController {

    @IBOutlet weak var viewTabata: UIView!
    @IBOutlet weak var buttonTabataStart: UIButton!
    @IBOutlet weak var buttonTabataRound: UIButton!
    @IBOutlet weak var buttonTabataWork: UIButton!
    @IBOutlet weak var buttonTabataRest: UIButton!
    @IBOutlet weak var labelTotalTime: UILabel!
    @IBOutlet weak var buttonTabataRep: UIButton!
    @IBOutlet weak var labelRecommend: UILabel!
    @IBOutlet weak var labelTabataRepSet: UILabel!
    @IBOutlet weak var labelTabataRepRest: UILabel!
    @IBOutlet weak var buttonTabataRepSet: UIButton!
    @IBOutlet weak var buttonTabataRepRest: UIButton!
  
    // Set the Array to fit into the pickers
    var isHidden: Bool = true
    var buttonRounds = [String]()
    var buttonTimes = [String]()
    var buttonRest = [String]()
    var buttonSetRounds = [String]()
    var buttonSetRest = [String]()
   
    var rounds = [String]()
    var times = [String]()
    var rest = [String]()
    var setRounds = [String]()
    var setRest = [String]()
    
    // Variables for Picker view
    var pickedRound: String?
    var pickedTime: String?
    var pickedRest: String?
    var pickedSetRound: String?
    var pickedSetRest: String?
    
    
    
    
    
    // Set value to send to segue
    var sendRound = [Int]()
    var sendTime = [Int]()
    var sendRest = [Int]()
    var sendSetRound = [Int]()
    var sendSetRest = [Int]()
    
    var indexRound = 7
    var indexWork = 15
    var indexRest = 10
    var indexSet = 0
    var indexSetRest = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // The shape and color of buttons are setting.
        viewTabata.layer.masksToBounds = true
        viewTabata.layer.cornerRadius = 20
        viewTabata.layer.masksToBounds = true
        viewTabata.layer.cornerRadius = 20
        buttonTabataRound.layer.masksToBounds = true
        buttonTabataRound.layer.cornerRadius = 20
        buttonTabataWork.layer.masksToBounds = true
        buttonTabataWork.layer.cornerRadius = 20
        buttonTabataRest.layer.masksToBounds = true
        buttonTabataRest.layer.cornerRadius = 20
        buttonTabataStart.layer.masksToBounds = true
        buttonTabataStart.layer.cornerRadius = 20
        buttonTabataRepSet.layer.masksToBounds = true
        buttonTabataRepSet.layer.cornerRadius = 20
        buttonTabataRepRest.layer.masksToBounds = true
        buttonTabataRepRest.layer.cornerRadius = 20
        
        
        // Insert Array to Enter PickerView and Button
        RoundInsert()
        WorkInsert()
        RestInsert()
        RepSetInsert()
        RepRestInsert()
        
        
        
        // Setting values for pickers and buttons when 'viewDidLoad'
        pickedRound = rounds[7]
        pickedTime = times[15]
        pickedRest = rest[10]
        pickedSetRound = setRounds[0]
        pickedSetRest = setRest[0]
        
      
        
        
        buttonTabataRound.setTitle(rounds[7], for: .normal)
        buttonTabataWork.setTitle(times[15], for: .normal)
        buttonTabataRest.setTitle(rest[10], for: .normal)
        buttonTabataRepSet.setTitle(setRounds[0], for: .normal)
        buttonTabataRepRest.setTitle(setRest[0], for: .normal)
        
        //
        labelTabataRepSet.isHidden = isHidden
        buttonTabataRepSet.isHidden = isHidden
        labelTabataRepRest.isHidden = isHidden
        buttonTabataRepRest.isHidden = isHidden

        calculateTotal()
    }
    
    // Hide buttons that will occur at the end of the timer.
    func RoundInsert(){
        for i in 1...100 {
            rounds.append("\(i) ???")
            buttonRounds.append("\(i) ???")
            sendRound.append(i)
        }
    }
    
    func WorkInsert(){
        var minute = 0
        var second = 0
       
        for i in 5...900{
            if i <= 30 {
                
                times.append("\(i) ???")
                buttonTimes.append("\(i) ???")
                sendTime.append(i)
                continue
            }else if i > 30 && i <= 55{
                if i % 5 == 0 {
                    
                    times.append("\(i) ???")
                    buttonTimes.append("\(i) ???")
                    sendTime.append(i)
                    continue
                }
            }else if i >= 60{
                minute = i / 60
                second = i % 60
                if i % 60 == 0 {
                    times.append("\(minute) ???")
                    buttonTimes.append("\(minute) ???")
                    sendTime.append(i)
                    continue
                }else{
                    if i < 600{
                        if i < 180 {
                            if i % 10 == 0 {
                                if second < 10 {
                                    times.append("0\(minute):0\(second) ???")
                                    buttonTimes.append("\(minute) ??? \(second) ???")
                                    sendTime.append(i)
                                    continue
                                }else{
                                    times.append("0\(minute):\(second) ???")
                                    buttonTimes.append("\(minute) ??? \(second) ???")
                                    sendTime.append(i)
                                    continue
                                }
                            }
                        }else if i < 420{
                            if i % 15 == 0 {
                                if second < 10 {
                                    times.append("0\(minute):0\(second) ???")
                                    buttonTimes.append("\(minute) ??? \(second) ???")
                                    sendTime.append(i)
                                    continue
                                }else{
                                    times.append("0\(minute):\(second) ???")
                                    buttonTimes.append("\(minute) ??? \(second) ???")
                                    sendTime.append(i)
                                    continue
                                }
                            }
                        }else{
                            if i % 30 == 0 {
                                if second < 10 {
                                    times.append("0\(minute):0\(second) ???")
                                    buttonTimes.append("\(minute) ??? \(second) ???")
                                    sendTime.append(i)
                                    continue
                                }else{
                                    times.append("0\(minute):\(second) ???")
                                    buttonTimes.append("\(minute) ??? \(second) ???")
                                    sendTime.append(i)
                                    continue
                                }
                            }
                        }
                        
                    }else{
                        if i % 60 == 0 {
                            if second < 10 {
                                times.append("\(minute):0\(second) ???")
                                buttonTimes.append("\(minute) ??? \(second) ???")
                                sendTime.append(i)
                            }else{
                                times.append("\(minute):\(second) ???")
                                buttonTimes.append("\(minute) ??? \(second) ???")
                                sendTime.append(i)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
    func RestInsert(){
        var minute = 0
        var second = 0
       
        for i in 0...900{
            if i <= 30 {
                rest.append("\(i) ???")
                buttonRest.append("\(i) ???")
                sendRest.append(i)
                continue
            }else if i > 30 && i <= 55{
                if i % 5 == 0 {
                    rest.append("\(i) ???")
                    buttonRest.append("\(i) ???")
                    sendRest.append(i)
                    continue
                }
            }else if i >= 60{
                minute = i / 60
                second = i % 60
                if i % 60 == 0 {
                    rest.append("\(minute) ???")
                    buttonRest.append("\(minute) ???")
                    sendRest.append(i)
                    continue
                }else{
                    if i < 600{
                        if i < 180 {
                            if i % 10 == 0 {
                                if second < 10 {
                                    rest.append("0\(minute):0\(second) ???")
                                    buttonRest.append("\(minute) ??? \(second) ???")
                                    sendRest.append(i)
                                    continue
                                }else{
                                    rest.append("0\(minute):\(second) ???")
                                    buttonRest.append("\(minute) ??? \(second) ???")
                                    sendRest.append(i)
                                    continue
                                }
                            }
                        }else if i < 420{
                            if i % 15 == 0 {
                                if second < 10 {
                                    rest.append("0\(minute):0\(second) ???")
                                    buttonRest.append("\(minute) ??? \(second) ???")
                                    sendRest.append(i)
                                    continue
                                }else{
                                    rest.append("0\(minute):\(second) ???")
                                    buttonRest.append("\(minute) ??? \(second) ???")
                                    sendRest.append(i)
                                    continue
                                }
                            }
                        }else{
                            if i % 30 == 0 {
                                if second < 10 {
                                    rest.append("0\(minute):0\(second) ???")
                                    buttonRest.append("\(minute) ??? \(second) ???")
                                    sendRest.append(i)
                                    continue
                                }else{
                                    rest.append("0\(minute):\(second) ???")
                                    buttonRest.append("\(minute) ??? \(second) ???")
                                    sendRest.append(i)
                                    continue
                                }
                            }
                        }
                        
                    }else{
                        if i % 60 == 0 {
                            if second < 10 {
                                rest.append("\(minute):0\(second) ???")
                                buttonRest.append("\(minute) ??? \(second) ???")
                                sendRest.append(i)
                            }else{
                                rest.append("\(minute):\(second) ???")
                                buttonRest.append("\(minute) ??? \(second) ???")
                                sendRest.append(i)
                            }
                        }
                    }
                }
            }
        }
    }
   
    func RepSetInsert(){
        for i in 1...10 {
            setRounds.append("\(i) ???")
            buttonSetRounds.append("\(i) ???")
            sendSetRound.append(i)
        }
    }
  
    func RepRestInsert(){
        var minute = 0
        var second = 0
       
        for i in 0...600{
             
            if i < 60{
                if i % 10 == 0 {
                    setRest.append("\(i) ???")
                    buttonSetRest.append("\(i) ???")
                    sendSetRest.append(i)
                    continue
                }
            }
            else if i >= 60{
                minute = i / 60
                second = i % 60
                if i % 60 == 0 {
                    setRest.append("\(minute) ???")
                    buttonSetRest.append("\(minute) ???")
                    sendSetRest.append(i)
                    continue
                }else{
                        if i < 300{
                            if i % 30 == 0 {
                                if second < 10 {
                                    setRest.append("0\(minute):0\(second) ???")
                                    buttonSetRest.append("\(minute) ??? \(second) ???")
                                    sendSetRest.append(i)
                                    continue
                                }else{
                                    setRest.append("0\(minute):\(second) ???")
                                    buttonSetRest.append("\(minute) ??? \(second) ???")
                                    sendSetRest.append(i)
                                    continue
                                }
                            }
                        }else {
                            if i % 60 == 0 {
                                if second < 10 {
                                    setRest.append("0\(minute):0\(second) ???")
                                    buttonSetRest.append("\(minute) ??? \(second) ???")
                                    sendSetRest.append(i)
                                    continue
                                }else{
                                    setRest.append("0\(minute):0\(second) ???")
                                    buttonSetRest.append("\(minute) ??? \(second) ???")
                                    sendSetRest.append(i)
                                    continue
                                }
                            }
                        }
                }
                            
                            
            }
        }
    }
    

    
    @IBAction func buttonTabataRep(_ sender: UIButton) {
        labelTabataRepSet.isHidden = true
        buttonTabataRep.isHidden = true
        labelRecommend.isHidden = true
        
        if isHidden {
            labelTabataRepSet.isHidden = false
            buttonTabataRepSet.isHidden = false
            labelTabataRepRest.isHidden = false
            buttonTabataRepRest.isHidden = false
        }else{
            labelTabataRepSet.isHidden = true
            buttonTabataRepSet.isHidden = true
            labelTabataRepRest.isHidden = true
            buttonTabataRepRest.isHidden = true
        }
        isHidden = !isHidden
        
    }
    
   
    
    @IBAction func buttonTabataRound(_ sender: UIButton) {
       
        let alert = UIAlertController( title: "????????? ???????????????", message: nil, preferredStyle: UIAlertController.Style.alert)
        let pickerViewValues: [[String]] = [rounds]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: indexRound )
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    self.pickedRound = self.rounds[index.row] // ???????????? ????????? ??? ????????? ???????????????.
                    self.buttonTabataRound.setTitle(self.pickedRound, for: .normal)
                    self.indexRound = index.row
                    self.calculateTotal()
                }
            }
        }
        alert.addAction(title: "??????", style: .cancel)
        alert.show()
    }
    @IBAction func buttonTabataWork(_ sender: UIButton) {
       
        let alert = UIAlertController( title: "????????? ???????????????", message: nil, preferredStyle: UIAlertController.Style.alert)
        let pickerViewValues: [[String]] = [times]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: indexWork )
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    self.pickedTime = self.times[index.row] // ???????????? ????????? ??? ????????? ???????????????.
                    self.buttonTabataWork.setTitle(self.buttonTimes[index.row], for: .normal)
                    self.indexWork = index.row
                    self.calculateTotal()
                }
            }
        }
        alert.addAction(title: "??????", style: .cancel)
        alert.show()
    }
    
    @IBAction func buttonTabataRest(_ sender: UIButton) {
        let alert = UIAlertController( title: "????????? ???????????????", message: nil, preferredStyle: UIAlertController.Style.alert)
        let pickerViewValues: [[String]] = [rest]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: indexRest )
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    self.pickedRest = self.rest[index.row]
                    self.buttonTabataRest.setTitle(self.buttonRest[index.row], for: .normal)
                    self.indexRest = index.row
                    self.calculateTotal()
                }
            }
        }
        alert.addAction(title: "??????", style: .cancel)
        alert.show()
    }
    
    @IBAction func buttonTabataRepSet(_ sender: UIButton) {
     
        let alert = UIAlertController( title: "????????? ???????????????", message: nil, preferredStyle: UIAlertController.Style.alert)
        let pickerViewValues: [[String]] = [setRounds]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: indexSet )
        
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    self.pickedSetRound = self.setRounds[index.row]
                    self.buttonTabataRepSet.setTitle(self.buttonSetRounds[index.row], for: .normal)
                    self.indexSet = index.row
                    self.calculateTotal()
                }
            }
        }


        alert.addAction(title: "??????", style: .cancel)
        alert.show()
    }
    
    @IBAction func buttonTabataRepRest(_ sender: UIButton) {
        let alert = UIAlertController( title: "????????? ???????????????", message: nil, preferredStyle: UIAlertController.Style.alert)
        let pickerViewValues: [[String]] = [setRest]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: indexSetRest )
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    self.pickedSetRest = self.setRest[index.row]
                    self.buttonTabataRepRest.setTitle(self.buttonSetRest[index.row], for: .normal)
                    self.indexSetRest = index.row
                    self.calculateTotal()
                }
            }
        }
        alert.addAction(title: "??????", style: .cancel)
        alert.show()
    }
    
    func calculateTotal(){
        var total = 1
        total =  sendSetRound[indexSet] * (sendRound[indexRound] * (sendTime[indexWork] + sendRest[indexRest]) - sendRest[indexRest]) + (sendSetRound[indexSet] - 1) * sendSetRest[indexSetRest]
        labelTotalTime.text = "??? ??????????????? \(total/60)??? \(total%60)????????????."
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "TabataSegue"{
             let timerView = segue.destination as! TabataTimerViewController
        
            timerView.receiveItem(sendRound[indexRound], sendTime[indexWork], sendRest[indexRest], sendSetRound[indexSet], sendSetRest[indexSetRest])
            
            
         }
    

    }
    

}
