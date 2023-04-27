import UIKit

class AddInfoController: UIViewController {

    private let reservationTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupDelegateAndDataSource()
        setupRegisterCells()
    }
    
    private func setupRegisterCells() {
        reservationTable.register(DateCell.self, forCellReuseIdentifier: DateCell.dateId)
    }
    
    private func setupDelegateAndDataSource() {
        reservationTable.dataSource = self
        reservationTable.delegate = self
    }
    
    private func setupLayout() {
        view.addSubview(reservationTable)
        
        NSLayoutConstraint.activate([
            reservationTable.topAnchor.constraint(equalTo: view.topAnchor),
            reservationTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reservationTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reservationTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension AddInfoController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

extension AddInfoController: UITableViewDelegate {
    
}
