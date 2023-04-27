//
//  AudioBookListViewController.swift
//  Assignment
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import UIKit
import CoreData

final class AudioBookListViewController: BaseViewController  {
    
    static var storyBoardId: String = ViewIdentifiers.listViewController
    static var storyBoardName: String = StoryBoard.main
    @IBOutlet private weak var tableView: UITableView!
    private var viewModel: AudioBookViewModel!
    private var dataSource: FetchResultController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func setUPUI() {
        let label = UILabel()
        label.text = StringConstants.podcasts
        label.font = UIFont.bold(size: 22)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        viewModel = AudioBookViewModel(factory: DependencyContainer.shared)
        viewModel.loadBestPodcasts()
        tableView.registerCell(AudioBookTableViewCell.self)
        tableView.tableFooterView = UIView()
        performFetchResult()
    }
    
    func performFetchResult() {
        dataSource = FetchResultController()
        dataSource?.dataSourceDelegate = self
        dataSource?.fetchPerform()
        tableView.reloadData()
    }

}

extension AudioBookListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let sections = dataSource?.numberOfSections() ?? 0
        return sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.numberOfRows(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: AudioBookTableViewCell.self, indexPath: indexPath)
        cell.model = dataSource?.object(at: indexPath)
        return cell
    }
}

extension AudioBookListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 50
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource?.object(at: indexPath)
        let controller = DetailsViewController.instantiateFromStoryBoard()
        controller.model = model
        push(controller)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let totalRows = tableView.numberOfRows(inSection: indexPath.section)
        viewModel.loadNewPage(isLoad: indexPath.row == totalRows - 1)
    }
}

extension AudioBookListViewController: FetchResultDelegate {
    func didChange(at indexPath: IndexPath?, action: FetchResultAction) {
        if action == .insert, let indexPath = indexPath {
            tableView.insertRows(at: [indexPath], with: .bottom)
        }
    }
    
    func controllerDidChangeContent() {
        tableView.reloadData()
    }
}
