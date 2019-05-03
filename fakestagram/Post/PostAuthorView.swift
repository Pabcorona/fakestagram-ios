//
//  Author.swift
//  fakestagram
//
//  Created by LuisE on 3/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit
@IBDesignable
class PostAuthorView: UIView{

    var author: Author? {
    didSet { updateView() }
}
// let avatarView: SVGView = {
    private let avatarView: SVGView = {
    let svg = SVGView()
    svg.translatesAutoresizingMaskIntoConstraints = false
    return svg
}()
//let nameLbl: UILabel = {
    private let nameLbl: UILabel = {
    let lbl = UILabel()
    lbl.text = "Lorem Ipsum"
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
}()

override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
}


required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
}


func setupView() {
    self.backgroundColor = .clear
    
    addSubview(avatarView)
    NSLayoutConstraint.activate([
        avatarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
        avatarView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 5),
        avatarView.widthAnchor.constraint(equalToConstant: 52),
        avatarView.heightAnchor.constraint(equalToConstant: 52)
        ])
    avatarView.clipsToBounds = true
    avatarView.layer.cornerRadius = 26
    
    addSubview(nameLbl)
    NSLayoutConstraint.activate([
        nameLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        nameLbl.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 15),
        nameLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
        nameLbl.heightAnchor.constraint(equalToConstant: 32)
        ])
}

    private func updateView() {
        guard let author = self.author else { return }
        nameLbl.text = author.name
       // avatarView.loadContent(for: author.avatarURL())
        avatarView.loadContent(from: author.avatarUrl())
    }
}


//import UIKit
//@IBDesignable
//class PostAuthorView: UIView {
//
//    var author: Author!{
//        didSet { updateView () }
//    }
//
//
//    let avatarView: SVGView = {
//        let svg = SVGView()
//        svg.translatesAutoresizingMaskIntoConstraints = false
//        return svg
//    }()
//    let label: UILabel = {
//       let Lbl = UILabel()
//        Lbl.text = "pablo corona"
//        Lbl.translatesAutoresizingMaskIntoConstraints = false
//        return Lbl
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupView()
//    }
//
//    func setupView() {
//        addSubview(avatarView)
//        NSLayoutConstraint.activate([avatarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5), avatarView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5), avatarView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5), avatarView.widthAnchor.constraint(equalToConstant: 52)])
//        avatarView.clipsToBounds = true
//        avatarView.layer.cornerRadius = 26
//
//        addSubview(label)
//        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10), label.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 15), label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5), label.heightAnchor.constraint(equalToConstant: 32)])
//
//
//        }
//
//    private func updateView() {
//        guard let author = self.author else { return }
//        label.text = author.name
//        avatarView.loadContent(for: author.avatarURL())
//    }
//}
//
//


