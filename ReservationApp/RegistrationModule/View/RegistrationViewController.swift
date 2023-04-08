import UIKit

class RegistrationViewController: UIViewController {

    private let viewModel = RegistrationViewModel()
    var isHidden = true
    
    private let logoImage = UIImageView(image: #imageLiteral(resourceName: "logoIcon"), contentMode: .scaleAspectFill)
    private let nameAndSurnameView = UIView(borderColor: .lightGray, borderWidth: 1)
    private let numberPhoneView = UIView(borderColor: .lightGray, borderWidth: 1)
    private let emailView = UIView(borderColor: .lightGray, borderWidth: 1)
    private let passwordView = UIView(borderColor: .lightGray, borderWidth: 1)
    private let isPasswordHiddenButton = UIButton(backgroundImage: #imageLiteral(resourceName: "passEyes-closed"))
    private let moveToAccountButton = UIButton(title: "Войти", titleColor: .red)
    
    private let mainStack = UIStackView(
        distribution: .fillEqually,
        axis: .vertical,
        spacing: 20,
        alighment: .fill
    )
    
    private let welcomeTitle = UILabel(
        title: "Создайте аккаунт для\nвхода в приложение",
        alignment: .left,
        textColor: .black,
        font: .systemFont(ofSize: 24),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )
    
    private let nameAndSurnameStack = UIStackView(
        distribution: .fill,
        axis: .vertical,
        spacing: 4,
        alighment: .leading
    )
    
    private let nameAndSurnameTitle = UILabel(
        title: "Имя и фамилия",
        alignment: .left,
        textColor: .black,
        font: .systemFont(ofSize: 14),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )
    
    private let nameAndSurnameTextField = UITextField(
        placeholder: "Введите имя и фамилию",
        borderColor: .clear,
        typeMode: .namePhonePad,
        secureType: false,
        cornerRadius: 10
    )
    
    private let numberPhoneStack = UIStackView(
        distribution: .fill,
        axis: .vertical,
        spacing: 4,
        alighment: .leading
    )
    
    private let numberPhoneTitle = UILabel(
        title: "Номер телефона",
        alignment: .left,
        textColor: .black,
        font: .systemFont(ofSize: 14),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )
    
    private let numberPhoneTextField = UITextField(
        placeholder: "+7 (---) --- -- --",
        borderColor: .clear,
        typeMode: .numberPad,
        secureType: false,
        cornerRadius: 10
    )
    
    private let errorTitle = UILabel(
        title: "Неверный формат номера телефона",
        alignment: .left,
        textColor: .red,
        font: .systemFont(ofSize: 14),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )
    
    private let emailStack = UIStackView(
        distribution: .fill,
        axis: .vertical,
        spacing: 4,
        alighment: .leading
    )
    
    private let emailTitle = UILabel(
        title: "Email",
        alignment: .left,
        textColor: .black,
        font: .systemFont(ofSize: 14),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )
    
    private let emailTextField = UITextField(
        placeholder: "Введите email",
        borderColor: .clear,
        typeMode: .emailAddress,
        secureType: false,
        cornerRadius: 10
    )
    
    private let passwordStack = UIStackView(
        distribution: .fill,
        axis: .vertical,
        spacing: 4,
        alighment: .leading
    )
    
    private let passwordTitle = UILabel(
        title: "Пароль",
        alignment: .left,
        textColor: .black,
        font: .systemFont(ofSize: 14),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )
    
    private let passwordTextField = UITextField(
        placeholder: "Введите пароль",
        borderColor: .clear,
        typeMode: .default,
        secureType: true,
        cornerRadius: 10
    )
    
    private let entryButton = UIButton(
        title: "Зарегистрироваться",
        backgroundColor: #colorLiteral(red: 0.6706767678, green: 0.112393342, blue: 0.1214761063, alpha: 1),
        titleColor: .white,
        cornerRadius: 10
    )
    
    private let entryAccountStack = UIStackView(
        distribution: .fill,
        axis: .horizontal,
        spacing: 3,
        alighment: .fill
    )
    
    private let registrationNewAccoutnTitle = UILabel(
        title: "Уже есть аккаунт?",
        alignment: .center,
        textColor: .lightGray,
        font: .systemFont(ofSize: 14),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addElements()
        setupLayout()
        addTargets()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.isHidden = true
        errorTitle.isHidden = true
    }
    
    private func addElements() {
        [logoImage, welcomeTitle, mainStack, entryButton, entryAccountStack].forEach { view.addSubview($0) }
        [nameAndSurnameStack, numberPhoneStack, emailStack, passwordStack].forEach { mainStack.addArrangedSubview($0) }
        [nameAndSurnameTitle, nameAndSurnameView].forEach { nameAndSurnameStack.addArrangedSubview($0) }
        nameAndSurnameView.addSubview(nameAndSurnameTextField)
        [numberPhoneTitle, numberPhoneView, errorTitle].forEach { numberPhoneStack.addArrangedSubview($0) }
        numberPhoneView.addSubview(numberPhoneTextField)
        [emailTitle, emailView].forEach { emailStack.addArrangedSubview($0) }
        emailView.addSubview(emailTextField)
        [passwordTextField, isPasswordHiddenButton].forEach { passwordView.addSubview($0) }
        [passwordTitle, passwordView].forEach { passwordStack.addArrangedSubview($0) }
        [registrationNewAccoutnTitle,
         moveToAccountButton].forEach { entryAccountStack.addArrangedSubview($0) }
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logoImage.heightAnchor.constraint(equalToConstant: 50),
            
            welcomeTitle.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 25),
            welcomeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            welcomeTitle.widthAnchor.constraint(equalToConstant: 250),
            
            nameAndSurnameTextField.centerYAnchor.constraint(equalTo: nameAndSurnameView.centerYAnchor),
            nameAndSurnameTextField.leadingAnchor.constraint(equalTo: nameAndSurnameView.leadingAnchor, constant: 10),
            nameAndSurnameTextField.trailingAnchor.constraint(equalTo: nameAndSurnameView.trailingAnchor, constant: -10),
            
            numberPhoneTextField.centerYAnchor.constraint(equalTo: numberPhoneView.centerYAnchor),
            numberPhoneTextField.leadingAnchor.constraint(equalTo: numberPhoneView.leadingAnchor, constant: 10),
            numberPhoneTextField.trailingAnchor.constraint(equalTo: numberPhoneView.trailingAnchor, constant: -10),
            
            emailTextField.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -10),
            
            passwordTextField.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 10),
            
            isPasswordHiddenButton.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
            isPasswordHiddenButton.leadingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: 180),
            isPasswordHiddenButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -10),
            
            mainStack.topAnchor.constraint(equalTo: welcomeTitle.bottomAnchor, constant: 15),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            nameAndSurnameView.heightAnchor.constraint(equalToConstant: 50),
            nameAndSurnameView.widthAnchor.constraint(equalToConstant: 360),
            
            emailView.heightAnchor.constraint(equalToConstant: 50),
            emailView.widthAnchor.constraint(equalToConstant: 360),
            
            numberPhoneView.heightAnchor.constraint(equalToConstant: 50),
            numberPhoneView.widthAnchor.constraint(equalToConstant: 360),
            
            passwordView.heightAnchor.constraint(equalToConstant: 50),
            passwordView.widthAnchor.constraint(equalToConstant: 360),
            
            entryButton.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 25),
            entryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            entryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            entryButton.heightAnchor.constraint(equalToConstant: 50),
            
            entryAccountStack.topAnchor.constraint(equalTo: entryButton.bottomAnchor, constant: 25),
            entryAccountStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func textFieldDelegate() {
        numberPhoneTextField.delegate = self
    }
    
    private func addTargets() {
        isPasswordHiddenButton.addTarget(self, action: #selector(isHiddenPassword), for: .touchUpInside)
        entryButton.addTarget(self, action: #selector(registrationNewUser), for: .touchUpInside)
        moveToAccountButton.addTarget(self, action: #selector(moveToSighin), for: .touchUpInside)
    }
    
    @objc private func isHiddenPassword() {
        if isHidden {
            isPasswordHiddenButton.setBackgroundImage(UIImage(named: "passEyes-open"), for: .normal)
            passwordTextField.isSecureTextEntry = false
            isHidden = false
        } else {
            isPasswordHiddenButton.setBackgroundImage(UIImage(named: "passEyes-closed"), for: .normal)
            passwordTextField.isSecureTextEntry = true
            isHidden = true
        }
    }
    
    @objc private func registrationNewUser() {
        guard let fullName = nameAndSurnameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let phoneNumber = numberPhoneTextField.text else { return }
        guard let email = emailTextField.text else { return }
        
        if fullName.isEmpty || password.isEmpty || phoneNumber.isEmpty || email.isEmpty {
            actionAlert()
        } else {
            viewModel.createNewUser(
                fullName: fullName,
                password: password,
                phoneNumber: phoneNumber,
                email: email
            )
            
            registerSuccessAlert()
        }
    }
    
    @objc private func moveToSighin() {
        navigationController?.popViewController(animated: true)
    }
    
    private func actionAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        
        present(alert, animated: true)
    }
    
    private func registerSuccessAlert() {
        let alert = UIAlertController(title: "Успешно", message: "Вы успешно зарегестрировались", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отлично", style: .default, handler: { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }))
        
        present(alert, animated: true)
    }
    
    
    private func isPasswordValid(_ password: String) -> Bool {
        let password = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return password.evaluate(with: password)
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }
        let lastText = (text as NSString).replacingCharacters(in: range, with: string) as String
        
        if numberPhoneTextField == textField {
            textField.text = lastText.appendingFormat("n nnn nnn nn nn", text)
            return false
        }
        return true
    }
}
