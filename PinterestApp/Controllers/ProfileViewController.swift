import UIKit

final class ProfileViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()

    let profileView = ProfileView()
    let editProfileButton = UIButton(type: .system)

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.register(ProfileCustomCell.self, forCellReuseIdentifier: ProfileCustomCell.identifier)

        return tableView
    }()

    let userCreatedLabel = UILabel()

    private let images: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStyle()
        setupLayout()

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension ProfileViewController {
    private func setupStyle() {
        view.backgroundColor = .systemBackground
        profileView.translatesAutoresizingMaskIntoConstraints = false

        EditProfileButton.translatesAutoresizingMaskIntoConstraints = false
        EditProfileButton.backgroundColor = .systemGray
        EditProfileButton.setTitle("Edit", for: .normal)
        EditProfileButton.setTitleColor(.darkText, for: .normal)
        EditProfileButton.layer.cornerRadius = 5

        EditProfileButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        usereCreatedLabel.translatesAutoresizingMaskIntoConstraints = false
        usereCreatedLabel.textAlignment = .center
        usereCreatedLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        usereCreatedLabel.adjustsFontForContentSizeCategory = true
        usereCreatedLabel.text = "Created"

        scrollView.translatesAutoresizingMaskIntoConstraints = false

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        profileView.translatesAutoresizingMaskIntoConstraints = false

        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        editProfileButton.backgroundColor = .systemGray
        editProfileButton.setTitle("Edit", for: .normal)
        editProfileButton.setTitleColor(.darkText, for: .normal)
        editProfileButton.layer.cornerRadius = 5

        editProfileButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        userCreatedLabel.translatesAutoresizingMaskIntoConstraints = false
        userCreatedLabel.textAlignment = .center
        userCreatedLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        userCreatedLabel.adjustsFontForContentSizeCategory = true
        userCreatedLabel.text = "Created"

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProfileCustomCell.self, forCellReuseIdentifier: ProfileCustomCell.identifier)
    }

    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addSubview(profileView)
        stackView.addSubview(editProfileButton)
        stackView.addSubview(userCreatedLabel)
        stackView.addSubview(tableView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            profileView.topAnchor.constraint(equalTo: stackView.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 220),

            editProfileButton.topAnchor.constraint(equalToSystemSpacingBelow: profileView.bottomAnchor, multiplier: 3),
            editProfileButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            editProfileButton.widthAnchor.constraint(equalTo: editProfileButton.titleLabel!.widthAnchor, constant: 16),

            userCreatedLabel.topAnchor.constraint(equalToSystemSpacingBelow: editProfileButton.bottomAnchor, multiplier: 5),
            userCreatedLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            userCreatedLabel.widthAnchor.constraint(equalToConstant: 100),

            tableView.topAnchor.constraint(equalToSystemSpacingBelow: userCreatedLabel.bottomAnchor, multiplier: 1),
            tableView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            tableView.heightAnchor.constraint(equalTo: tableView.widthAnchor, multiplier: CGFloat(images.count))

        ])
    }
}

extension ProfileViewController {
    @objc
    private func buttonTapped() {
        navigationController?.pushViewController(EditProfileViewController(), animated: true)
    }
}
