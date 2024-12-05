import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var historyTextView: UITextView! // История изменений
    
    @IBOutlet weak private var mainLabel: UILabel! // Лэйбл счётчика
    
    private var number = 0 // Счётчик
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text += "\n"
    }
    
    // Обновить счётчик
    private func showNumber() {
        mainLabel.text = String(number)
    }
    
    // Получить текущее время
    private func getTime() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
    
    // Нажатие +
    @IBAction private func plusButton(_ sender: Any) {
        number += 1
        showNumber()
        
        historyTextView.text += "[\(getTime())]: значение изменено на +1\n"
    }
    
    // Нажатие -
    @IBAction private func minusButton(_ sender: Any) {
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
    @IBAction private func resetButton(_ sender: Any) {
        number = 0
        showNumber()
        
        historyTextView.text += "[\(getTime())]: значение сброшено\n"
    }
}

