//
//  MoedasViewController.swift
//  ProjetoFinalSquad3
//
//  Created by Adalberto Sena Silva on 15/04/21.
//

import UIKit
import Commons
import AlamofireImage
import DetalhesMoedas
import CoreData


class MoedasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate, UISearchBarDelegate {
    
     // MARK: - Outlets
    
    @IBOutlet weak var listaMoedas: UITableView!
    @IBOutlet weak var pesquisarMoeda: UISearchBar!
    
    // MARK: - Selecao de Atributos da Classe

    var listaDeMoedas:[Criptomoeda] = []
    
    var listaDePesquisa:[Criptomoeda] = []
    
    var listaSiglasFavoritas: [String] = []
    
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    var gerenciadorDeResultados:NSFetchedResultsController<Favoritos>?
    

    
    // MARK: - Ciclo de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listaMoedas.register(UINib(nibName: "CustumTableViewCell", bundle: nil), forCellReuseIdentifier: "CustumTableViewCell")
        self.listaMoedas.delegate = self
        self.listaMoedas.dataSource = self
        self.pesquisarMoeda.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        makeRequest{ (listaDeMoedas) in
            self.listaDeMoedas = listaDeMoedas
            self.listaDePesquisa = self.listaDeMoedas
            DispatchQueue.main.async {
                self.listaMoedas.reloadData()
            }
        }
    }
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listaDePesquisa.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustumTableViewCell", for: indexPath) as! CustumTableViewCell
        let moedaAtual = listaDePesquisa[indexPath.row]
        cell.configuraCelula(listaSiglasFavoritas, moedaAtual)
        guard let gerenciador = gerenciadorDeResultados?.fetchedObjects else {return cell}
        if gerenciador.count > 0 {
            for i in 0...(((gerenciadorDeResultados?.fetchedObjects!.count)!) - 1) {
                guard let sigla = gerenciador[i].lista else {return cell}
                listaSiglasFavoritas.append(sigla)
            }
        }
        cell.configuraCelula(listaSiglasFavoritas, moedaAtual)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let moedaSelecionada = listaDePesquisa[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhesMoedaSelecionada") as! DetalhesViewController
        controller.moedaSelecionada = moedaSelecionada
        show(controller, sender: self)
        //self.navigationController?.pushViewController(controller, animated: true)
    }

    
    // MARK: - Request
    
    func makeRequest(completion:@escaping([Criptomoeda]) -> Void) {
        let url = URL(string: ApiRest.TodasAsMoedas)!
//        let url = URL(string: "https://6076e5cf1ed0ae0017d6a02f.mockapi.io/api/v1/users")!
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print(response as Any)
                guard let responseData = data else { return }
                do {
                    let moedas = try JSONDecoder().decode(Moedas.self, from: responseData)
                    for i in 0...5 {
                        var moedaFiltrada = moedas.filter {$0.typeIsCrypto == 1 && $0.priceUsd ?? 0>0 && (($0.idIcon?.isEmpty) != nil)}
                        
                        print(moedaFiltrada)
                        guard let sigla = moedaFiltrada[i].assetID else {return}
                        guard let nome = moedaFiltrada[i].name else {return}
                        guard let valor = moedaFiltrada[i].priceUsd else {return}
                        guard let idIcon = moedaFiltrada[i].idIcon else {return}
                        let criptomoeda = Criptomoeda(sigla: sigla, nome: nome, valor: valor, imagem: idIcon)
                        self.listaDeMoedas.append(criptomoeda)
                        
                        print(self.listaDeMoedas)
                     }
                    completion(self.listaDeMoedas)
                } catch let error {
                    //chamar função de tratamento passando error como parâmetro:
                    guard let httpResponse = response as? HTTPURLResponse else {return}
                    
                    self.tratarErros(httpResponse)
                    print("error: \(error)")
                }
            }
        task.resume()
    }
    
    
    // MARK: - Funções
    
    func recuperaFavoritos() {
        let recuperaFavoritos: NSFetchRequest<Favoritos> = Favoritos.fetchRequest()
        let ordenaPorNome = NSSortDescriptor(key: "lista", ascending: true)
        recuperaFavoritos.sortDescriptors = [ordenaPorNome]
        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: recuperaFavoritos, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        gerenciadorDeResultados?.delegate = self
        do {
            try gerenciadorDeResultados?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func tratarErros(_ erro: HTTPURLResponse) {
        let resposta = erro.statusCode
        switch resposta {
            case 400:
                self.alertaDoWindow(titulo: "Erro 400: Bad Request", message: "Falha na requisição dos dados, sintaxe invalida!")
            case 401:
                self.alertaDoWindow(titulo: "Erro 401: Unauthorized", message: "Falha na requisição dos dados, autenticação inválida!")
            case 403:
                self.alertaDoWindow(titulo: "Erro 403: Forbidden", message: "Falha na requisição dos dados, sem permissão para acesso!")
            case 429:
                self.alertaDoWindow(titulo: "Erro 429: Too Many Requests", message: "Falha na requisição dos dados, quantidade de requisição excedida!")
            case 550:
                self.alertaDoWindow(titulo: "Erro 550: No Data", message: "Requisição sem dados!")
            default:
                break
          }
    }
    
    func alertaDoWindow(titulo: String, message: String) {
        let alerta = UIAlertController(title: titulo, message: message, preferredStyle: .alert)
        let botaoOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(botaoOk)
        alerta.present(alerta, animated: true, completion: nil)
    }
    
    
    // MARK: - SearchBar

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaDePesquisa = listaDeMoedas
        if searchText != "" {
            let textoPesquisado = searchText
            let moedasFiltradas = listaDePesquisa.filter { $0.nome.range(of: textoPesquisado, options: [.caseInsensitive]) != nil }
            listaDePesquisa = moedasFiltradas
        }
      listaMoedas.reloadData()
    }
}
