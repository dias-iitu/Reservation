import UIKit

class ReservationViewController: UIViewController {

    private let reservationTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let emptyView: ReservationEmptyView = {
        let emptyView = ReservationEmptyView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        return emptyView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupRegisterCell()
        setupDataSourceAndDelegate()
        view.backgroundColor = .yellow
    }
 
    private func setupRegisterCell() {
        reservationTableView.register(ReservationCell.self, forCellReuseIdentifier: ReservationCell.reservationId)
    }
    
    private func setupDataSourceAndDelegate() {
        reservationTableView.delegate = self
        reservationTableView.dataSource = self
    }
    
    private func setupLayout() {
        view.addSubview(reservationTableView)
       // reservationTableView.backgroundView = emptyView
        
        NSLayoutConstraint.activate([
            reservationTableView.topAnchor.constraint(equalTo: view.topAnchor),
            reservationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reservationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reservationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

extension ReservationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

extension ReservationViewController: UITableViewDelegate {
    
}
