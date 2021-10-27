//
//  SearchViewController.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 24/10/21.
//

import UIKit
import RxSwift
import RxDataSources
import SDWebImage

class SearchViewController: UIViewController {
    typealias ViewModelType = SearchViewModel
    var viewModel: SearchViewModel!
    private let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        setupProperties()
    }
}

private extension SearchViewController {
    func setupProperties() {
        let nib = UINib(nibName: "SearchTableViewCell",
                        bundle: Bundle(for: SearchTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: "SearchTableViewCell")

        let dataSource = RxTableViewSectionedReloadDataSource<SearchDataSource>(
            configureCell: { dataSource, tableView, indexPath, item in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell",
                                                               for: indexPath) as? SearchTableViewCell else {
                    return  UITableViewCell()
                }
                cell.configure(item: item)
                return cell
            }
        )

        viewModel.properties
            .asObservable()
            .map { [SearchDataSource(header: "", items: $0)] }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        tableView.rx
            .itemSelected
            .asObservable().debug()
            .map { dataSource[$0]}
            .bind(to: viewModel.propertySelected)
            .disposed(by: disposeBag)
    }
}
