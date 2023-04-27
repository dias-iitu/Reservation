import UIKit

class DateCell: UITableViewCell {

    static let dateId = "dateId"
    
    private let dateLbl = UILabel(
        title: "Дата",
        alignment: .left,
        textColor: .black,
        font: .systemFont(ofSize: 14),
        lineBreakMode: .byWordWrapping,
        numberOfLines: 0
    )
    
    private let dateTxtField = UITextField(
        placeholder: "Выберите дату",
        borderColor: .gray,
        typeMode: .default,
        secureType: false,
        cornerRadius: 15
    )
    
    private let dateIcon = UIImageView(image: #imageLiteral(resourceName: "calendar"), contentMode: .scaleAspectFill)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        dateTxtField.rightView = dateIcon
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [dateLbl, dateTxtField].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            dateLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dateLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            dateTxtField.topAnchor.constraint(equalTo: dateLbl.bottomAnchor, constant: 5),
            dateTxtField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateTxtField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dateTxtField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            dateTxtField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
