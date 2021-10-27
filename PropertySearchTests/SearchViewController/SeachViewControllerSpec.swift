//
//  SeachViewControllerSpec.swift
//  PropertySearchTests
//
//  Created by Dushyant Singh on 27/10/21.
//

import Nimble
import Quick
import RxCocoa
import RxSwift

@testable import PropertySearch

class SeachViewControllerSpec: QuickSpec {
    override func spec() {
        describe("SeachViewControllerSpec test") {
            var subject: SearchViewController!
            let mockService = MockService()
            beforeEach {
                subject = UIViewController.make(viewController: SearchViewController.self)
                let viewModel = SearchViewModel(searchService: mockService)
                subject.viewModel = viewModel
                _ = subject.view
            }
            context("When service returns properties") {
                beforeEach {
                    mockService.mockPropertyObservable.onNext([PropertyFactory.property_1])
                }
                it("should have one property") {
                    expect(subject.tableView.numberOfRows(inSection: 0)) == 1
                    expect(subject.tableView.numberOfSections) == 1
                }
                it("should have project name as Test Name") {
                    guard let cell = subject.tableView.cellForRow(at: IndexPath(row: 0,
                                                                          section: 0)) as? SearchTableViewCell
                    else {
                        fail("No cell found")
                        return
                    }
                    expect(cell.titleLabel.text) == "Test Name"
                }
                it("should have correct address") {
                   guard let cell = subject.tableView.cellForRow(at: IndexPath(row: 0,
                                                                          section: 0)) as? SearchTableViewCell
                    else {
                        fail("No cell found")
                        return
                    }
                    expect(cell.addressLabel.text) == "1 Dark Alley . Gotham"
                }
                it("should have correct description") {
                    let cell = subject.tableView.cellForRow(at: IndexPath(row: 0,
                                                                          section: 0)) as! SearchTableViewCell
                    expect(cell.descriptionLabel.text) == "Condo . 2001 . 99 yrs"
                }
                it("should have correct room attributes") {
                    let cell = subject.tableView.cellForRow(at: IndexPath(row: 0,
                                                                          section: 0)) as! SearchTableViewCell
                    expect(cell.roomsLabel.text) == "2 Beds . 2 Baths . 2,000 sqft"
                }
                it("should have correct price") {
                    let cell = subject.tableView.cellForRow(at: IndexPath(row: 0,
                                                                          section: 0)) as! SearchTableViewCell
                    expect(cell.amountLabel.text) == "$30000/mo"
                }
            }
        }
    }
}

