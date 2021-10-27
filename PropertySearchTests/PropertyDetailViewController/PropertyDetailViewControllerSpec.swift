//
//  PropertyDetailViewControllerSpec.swift
//  PropertySearchTests
//
//  Created by Dushyant Singh on 27/10/21.
//

import Nimble
import Quick
import RxCocoa
import RxSwift

@testable import PropertySearch

class PropertyDetailViewControllerSpec: QuickSpec {
    override func spec() {
        describe("PropertyDetailViewControllerSpec test") {
            var subject: PropertyDetailViewController!
            beforeEach {
                subject = UIViewController.make(viewController: PropertyDetailViewController.self)
                let viewModel = PropertyDetailViewModel(detail: PropertyFactory.propertyDetail_1)
                subject.viewModel = viewModel
                _ = subject.view
            }
            context("When view loads") {
                it("should have one property") {
                    expect(subject.tableView.numberOfSections) == 1
                }
                it("should display all the property details") {
                    expect(subject.tableView.numberOfRows(inSection: 0)) == 22
                }

                it("should have price") {
                    let cell = subject.tableView.cellForRow(at: IndexPath(row: 0,
                                                                          section: 0)) as! LabelTableViewCell
                    expect(cell.label.text) == "$2020"
                }

                it("should have project name as Test Name") {
                    guard let cell = subject.tableView.cellForRow(at: IndexPath(row: 2,
                                                                          section: 0)) as? LabelTableViewCell
                    else {
                        fail("No cell found")
                        return
                    }
                    expect(cell.label.text) == "Test name"
                }

                it("should have address title") {
                    guard let cell = subject.tableView.cellForRow(at: IndexPath(row: 4,
                                                                          section: 0)) as? LabelTableViewCell
                    else {
                        fail("No cell found")
                        return
                    }
                    expect(cell.label.text) == "Something there"
                }
                it("should have address subtitle") {
                   guard let cell = subject.tableView.cellForRow(at: IndexPath(row: 6,
                                                                          section: 0)) as? LabelTableViewCell
                    else {
                        fail("No cell found")
                        return
                    }
                    expect(cell.label.text) == "Something here"
                }

                it("should have room attributes") {
                    guard let cell = subject.tableView.cellForRow(at: IndexPath(row: 8,
                                                                          section: 0)) as? LabelTableViewCell
                    else {
                        fail("No cell found")
                        return
                    }
                    expect(cell.label.text) == "2 Beds . 2 Baths . 2,000 sqft"
                }
                it("should have property details") {
                    guard let cell = subject.tableView.cellForRow(at: IndexPath(row: 12,
                                                                          section: 0)) as? LabelTableViewCell
                    else {
                        fail("No cell found")
                        return
                    }
                    expect(cell.label.text) == "Property details"
                }
                it("should have property detail values") {
                    guard let cell = subject.tableView.cellForRow(at: IndexPath(row: 15,
                                                                          section: 0)) as? TitleLabelTableViewCell
                    else {
                        fail("No cell found")
                        return
                    }
                    expect(cell.titleLabel.text) == "Some Label"
                    expect(cell.label.text) == "Some Text"
                }
                it("should have property description") {
                    subject.tableView.scrollToRow(at: IndexPath(row: 21, section: 0), at: .top, animated: false)
                    guard let cell = subject.tableView.cellForRow(at: IndexPath(row: 21,
                                                                                section: 0)) as? LabelTableViewCell
                    else {
                        fail("No cell found")
                        return
                    }
                    expect(cell.label.text) == "Some description"
                }
            }
        }
    }
}

