//
//  CompanyListViewController.swift
//  LifehackStudioApp
//
//  Created by Alexander Smyshlaev on 27/06/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

class CompanyListViewController: UIViewController {
    private let companiesReadService: CompaniesReadService
    
    private var companies = [CompactCompany]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = makeView {
        $0.dataSource = self
        $0.delegate = self
        $0.register(cell: UITableViewCell.self)
    }
    
    init(companiesReadService: CompaniesReadService) {
        self.companiesReadService = companiesReadService
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Companies"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        tableView.constraintsToEdges(of: view).activate()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didRefresh(sender:)), for: .valueChanged)
        
        tableView.refreshControl = refreshControl
        
        reloadCompanies()
    }
    
    private func reloadCompanies(completion: (() -> Void)? = nil) {
        companiesReadService.allCompanies { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let companies):
                    self?.companies = companies
                case .failure(let error):
                    self?.presentError(error)
                }
                
                completion?()
            }
        }
    }
    
    private func presentCompany(_ company: CompactCompany) {
        companiesReadService.company(withId: company.id) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let company):
                    let companyViewController = CompanyViewController(company: company)
                    self?.navigationController?.pushViewController(companyViewController, animated: true)
                case .failure(let error):
                    self?.presentError(error)
                }
            }
        }
    }
    
    private func presentError(_ error: Error) {
        let alert = UIAlertController(title: "Failed lo load companies",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true)
    }
    
    @objc private func didRefresh(sender: UIRefreshControl) {
        reloadCompanies {
            sender.endRefreshing()
        }
    }
}

extension CompanyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: UITableViewCell.self, for: indexPath)
        
        let company = companies[indexPath.row]
        cell.textLabel?.text = company.name
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

extension CompanyListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let company = companies[indexPath.row]
        presentCompany(company)
    }
}
