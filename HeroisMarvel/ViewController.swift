//
//  ViewController.swift
//  HeroisMarvel
//
//  Created by Eric Brito on 22/10/17.
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Fecha o teclado ao sair da tela
        tfName.resignFirstResponder()

        //Envia o conteudo da textfield para a proxima tela
        let vc = segue.destination as! HeroesTableViewController
        vc.name = tfName.text
    }
}

