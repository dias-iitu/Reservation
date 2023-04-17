import UIKit

class LoginViewController: UIViewController {

    var isHidden = true
    private let viewModel = LoginViewModel()
    
    private let emailView = UIView(borderColor: .lightGray, borderWidth: 1)
    private let passwordView = UIView(borderColor: .lightGray, borderWidth: 1)
    private let logoImage = UIImageView(image: #imageLiteral(resourceName: "logoIcon"), contentMode: .scaleAspectFill)
    private let rightLineImage = UIImageView(image: #imageLiteral(resourceName: "seperatorLine"), contentMode: .scaleAspectFill)
    private let leftLineImage = UIImageView(image: #imageLiteral(resourceName: "seperatorLine"), contentMode: .scaleAspectFill)
    private let entryAnotherAccount = UIImageView(image: #imageLiteral(resourceName: "Frame 15"), contentMode: .scaleAspectFill)
    
    private let createNewAccountButton = UIButton(title: "Создать", titleColor: .red)
    private let isPasswordHiddenButton = UIButton(backgroundImage: #imageLiteral(resourceName: "passEyes-closed"))
    private let restorePasswordButton = UIButton(title: "Забыли пароль?",
                                                 titleColor: .lightGray)
    private let entryWithGoogleAccountButton = UIButton(backgroundImage: #imageLiteral(resourceName: "googleAccount"))
    private let entryWithFacebookAccountButton = UIButton(backgroundImage: #imageLiteral(resourceName: "facebookAccount"))
    
    private let welcomeTitle = UILabel(
        title: "Добро пожаловать в\nAlmaty Hogo",
        alignment: .left,
        textColor: .black,
        font: .systemFont(ofSize: 24),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )
  
    private let emailStack = UIStackView(
        distribution: .fill,
        axis: .vertical,
        spacing: 4,
        alighment: .leading
    )
    
    private let passwordStack = UIStackView(
        distribution: .fill,
        axis: .vertical,
        spacing: 4,
        alighment: .leading
    )
    
    private let createNewAccountStack = UIStackView(
        distribution: .fill,
        axis: .horizontal,
        spacing: 3,
        alighment: .fill
    )
    
    private let anotherEntryButtonsStack = UIStackView(
        distribution: .fillEqually,
        axis: .horizontal,
        spacing: 16,
        alighment: .fill
    )
    
    private let emailAndPasswordStack = UIStackView(
        distribution: .fill,
        axis: .vertical,
        spacing: 20,
        alighment: .fill
    )
    
    private let emailTitle = UILabel(
        title: "Email",
        alignment: .left,
        textColor: .black,
        font: .systemFont(ofSize: 14),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )
    
    let emailTextField = UITextField(
        placeholder: "Введите email",
        borderColor: .clear,
        typeMode: .emailAddress,
        secureType: false,
        cornerRadius: 10
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
    
    private let passwordErrorTitle = UILabel(
        title: "Неверный пароль",
        alignment: .left,
        textColor: .red,
        font: .systemFont(ofSize: 14),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )

    private let entryButton = UIButton(
        title: "Войти",
        backgroundColor: #colorLiteral(red: 0.6706767678, green: 0.112393342, blue: 0.1214761063, alpha: 1),
        titleColor: .white,
        cornerRadius: 10
    )
    
    private let registrationNewAccoutnTitle = UILabel(
        title: "У вас нет аккаунта?",
        alignment: .center,
        textColor: .lightGray,
        font: .systemFont(ofSize: 14),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        addTargets()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        passwordErrorTitle.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupLayout() {
        emailView.addSubview(emailTextField)
        [passwordTextField, isPasswordHiddenButton].forEach { passwordView.addSubview($0) }
        [logoImage, welcomeTitle, emailAndPasswordStack, restorePasswordButton, entryButton, createNewAccountStack,
         entryAnotherAccount, anotherEntryButtonsStack].forEach { view.addSubview($0) }
        [emailStack, passwordStack].forEach { emailAndPasswordStack.addArrangedSubview($0) }
        [emailTitle, emailView].forEach { emailStack.addArrangedSubview($0) }
        [passwordTitle, passwordView, passwordErrorTitle].forEach { passwordStack.addArrangedSubview($0) }
        [registrationNewAccoutnTitle,
         createNewAccountButton].forEach { createNewAccountStack.addArrangedSubview($0) }
        [entryWithGoogleAccountButton,
         entryWithFacebookAccountButton].forEach { anotherEntryButtonsStack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logoImage.heightAnchor.constraint(equalToConstant: 50),
            
            welcomeTitle.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 25),
            welcomeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            welcomeTitle.widthAnchor.constraint(equalToConstant: 250),
            
            emailTextField.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -10),
            
            passwordTextField.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 10),
            
            isPasswordHiddenButton.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
            isPasswordHiddenButton.leadingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: 180),
            isPasswordHiddenButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -10),
            
            emailAndPasswordStack.topAnchor.constraint(equalTo: welcomeTitle.bottomAnchor, constant: 25),
            emailAndPasswordStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailAndPasswordStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            emailView.heightAnchor.constraint(equalToConstant: 50),
            emailView.widthAnchor.constraint(equalToConstant: 360),
            
            passwordView.heightAnchor.constraint(equalToConstant: 50),
            passwordView.widthAnchor.constraint(equalToConstant: 360),
            
            restorePasswordButton.topAnchor.constraint(equalTo: emailAndPasswordStack.bottomAnchor, constant: 16),
            restorePasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            restorePasswordButton.heightAnchor.constraint(equalToConstant: 25),
            
            entryButton.topAnchor.constraint(equalTo: restorePasswordButton.bottomAnchor, constant: 25),
            entryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            entryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            entryButton.heightAnchor.constraint(equalToConstant: 44),
            
            createNewAccountStack.topAnchor.constraint(equalTo: entryButton.bottomAnchor, constant: 25),
            createNewAccountStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            entryAnotherAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            entryAnotherAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            anotherEntryButtonsStack.topAnchor.constraint(equalTo: entryAnotherAccount.bottomAnchor, constant: 25),
            anotherEntryButtonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            anotherEntryButtonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            anotherEntryButtonsStack.heightAnchor.constraint(equalToConstant: 50),
            anotherEntryButtonsStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45),
            
            
        ])
    }
    
    private func addTargets() {
//        createNewAccountButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        entryButton.addTarget(self, action: #selector(signInUser), for: .touchUpInside)
        createNewAccountButton.addTarget(self, action: #selector(moveToRegistration), for: .touchUpInside)
        isPasswordHiddenButton.addTarget(self, action: #selector(isHiddenPassword), for: .touchUpInside)
        entryWithGoogleAccountButton.addTarget(self, action: #selector(loginWithGoogle), for: .touchUpInside)
//        entryWithFacebookAccountButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
//        restorePasswordButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
    
    @objc private func loginWithGoogle() {
        
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
    
    @objc private func moveToRegistration() {
        let regVC = RegistrationViewController()
        navigationController?.pushViewController(regVC, animated: true)
    }
    
    @objc private func signInUser() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if email.isEmpty || password.isEmpty {
            actionAlert()
        } else {
            viewModel.logInUser(email: email, password: password)
            
            let mainTabBar = MainTabBar()
            navigationController?.pushViewController(mainTabBar, animated: true)
        }
    }
    
    private func actionAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        
        present(alert, animated: true)
    }

}
