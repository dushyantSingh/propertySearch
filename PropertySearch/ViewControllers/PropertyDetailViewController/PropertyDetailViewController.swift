//
//  PropertyDetailViewController.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 27/10/21.
//

import UIKit
import RxDataSources
import RxSwift

class PropertyDetailViewController: UIViewController {
    typealias ViewModelType = PropertyDetailViewModel
    var viewModel: PropertyDetailViewModel!
    @IBOutlet weak var tableView: UITableView!

    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetails()
    }
}
extension PropertyDetailViewController {
    func setupDetails() {
        let dataSource = RxTableViewSectionedReloadDataSource<DetailDatasource>(
            configureCell: { dataSource, tableView, indexPath, item in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: item.identifier,
                                                               for: indexPath) as? DetailTableViewCell
                else {
                    return  UITableViewCell()
                }
                cell.configure(item)
                return cell
            }
        )

        viewModel.propertyDataSource
            .asObservable()
            .subscribe(onNext: { dataSource in
                dataSource.forEach { self.registerCells($0.items) }
            })
            .disposed(by: disposeBag)

        viewModel.propertyDataSource
            .asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

    func registerCells(_ items: [DetailCellType]) {
        items.forEach { [weak self] item in
            let nib = UINib(nibName: item.identifier,
                            bundle: Bundle(for: DetailTableViewCell.self))
            self?.tableView.register(nib,
                                     forCellReuseIdentifier: item.identifier)
        }
    }
}
