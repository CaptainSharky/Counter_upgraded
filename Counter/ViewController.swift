import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var historyTextView: UITextView! // История изменений
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text += "\n"
    }
    
    @IBOutlet weak var mainLabel: UILabel! // Лэйбл счётчика
    
    var number = 0 // Счётчик
    
    // Нажатие +
    @IBAction func plusButton(_ sender: Any) {
        number += 1
        showNumber()
        
        historyTextView.text += "[\(getTime())]: значение изменено на +1\n"
    }
    
    // Нажатие -
    @IBAction func minusButton(_ sender: Any) {
        // Проверка корректности счётчика
        if number > 0 {
            number -= 1
            showNumber()
            
            historyTextView.text += "[\(getTime())]: значение изменено на -1\n"
        } else {
            
            historyTextView.text += "[\(getTime())]: попытка уменьшить значение счётчика ниже 0\n"
        }
    }
    
    // Нажатие кнопки обнуления
    @IBAction func resetButton(_ sender: Any) {
        number = 0
        showNumber()
        
        historyTextView.text += "[\(getTime())]: значение сброшено\n"
    }
    
    // Обновить счётчик
    func showNumber() {
        mainLabel.text = String(number)
    }
    
    // Получить текущее время
    func getTime() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
}

