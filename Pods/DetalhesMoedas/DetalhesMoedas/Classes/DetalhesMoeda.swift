
import UIKit
import AlamofireImage
import Commons

public class DetalhesMoeda: UIView {
    
    // MARK: - Variáveis

    //var ehFavorito = false
    var delegate: DetalhesMoedaDelegate?
    @objc var buttonAction: (() -> Void)?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var viewSup: UIView!
    @IBOutlet weak var siglaMoedaLabel: UILabel!
    @IBOutlet weak var favoritoImage: UIImageView!
    @IBOutlet weak var moedaImage: UIImageView!
    @IBOutlet weak var valorMoedaLabel: UILabel!
    @IBOutlet weak var valorHoraLabel: UILabel!
    @IBOutlet weak var valorMesLabel: UILabel!
    @IBOutlet weak var valorAnoLabel: UILabel!
    
    // MARK: - Métodos
    
    public func makeRequestDetalhes(_ sigla: String, _ estrela: String) {
        let newUrl = "https://rest.coinapi.io/v1/assets/@@@?apikey=1F8A5E86-F1C9-41C7-B8BB-9DB1B81FDE7C".replacingOccurrences(of: "@@@", with: sigla)
            //let newUrl = ApiRest.MoedaDetalhe.replacingOccurrences(of: "@@@", with: sigla)
            let url = URL(string: newUrl)!
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print(response as Any)
                guard let responseData = data else { return }
                do {
                    let moedas = try JSONDecoder().decode(Moeda.self, from: responseData)
                    for moeda in moedas {
                        DispatchQueue.main.async {
                            self.configuraTela(moeda, estrela)
                        }
                    }
                } catch let error {
                    print("error: \(error)")
                }
            }
            task.resume()
        }

    public func verificarFavoritos(_ ehFavorita: Bool) {
//            let listaDeFavoritos = favoritos.split(separator: "|")
            //if listaDeFavoritos.contains(sigla) {
        if ehFavorita {
                //ehFavorito = true
            configurarButton(ActionButton.Remover)
            favoritoImage.isHidden = false
            //favoritoImage.image = UIImage(named: estrela)
        } else {
            configurarButton(ActionButton.Adicionar)
            favoritoImage.isHidden = true
        }
    }

    func configuraTela(_ moeda: MoedaElement, _ estrela: String) {
        viewSup.backgroundColor = HeaderCores.headerColor
        siglaMoedaLabel.text = moeda.assetID
        valorMoedaLabel.text = moeda.priceUsd.formatador()
        valorHoraLabel.text = moeda.volume1HrsUsd.formatador()
        valorMesLabel.text = moeda.volume1DayUsd.formatador()
        valorAnoLabel.text = moeda.volume1MthUsd.formatador()
        favoritoImage.image = UIImage(named: estrela)
        let caminhoIcon = moeda.idIcon
        let id = caminhoIcon.replacingOccurrences(of: "-", with: "")
        let url = ApiRest.UrlIcon.replacingOccurrences(of: "@@@", with: id)
        guard let urlCompleta = URL(string: url) else {return}
        moedaImage.af.setImage(withURL: urlCompleta)
    }
    
    func configurarButton(_ acao: String) {
        let button = ButtonDetalhes.centralButton
        button.setTitle(acao, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(botaoAcao), for: .touchUpInside)
        viewButton.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewButton, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewButton, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 240)
        let heightConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 60)
        viewButton.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }

    public func setupUI(moedaDelegate: DetalhesMoedaDelegate?) {
        delegate = moedaDelegate
    }
    
    @objc public func botaoAcao() {
        if let _buttonAction = buttonAction {
                _buttonAction()
        } else {
            delegate?.buttonAction()
        }
    }
}

    // MARK: - Extensions

extension UIView {

    public static var bundleUI: Bundle {
        var bundle: Bundle
        if let b = Bundle(identifier: "org.cocoapods.demo.DetalhesMoedas") {
            bundle = b
        } else {
            bundle = Bundle(for: self)
        }
        return bundle
    }

    public class func fromNib() -> Self {
        return fromNib(viewType: self)
    }

    public class func fromNib<T: UIView>(viewType: T.Type) -> T {
        if let nib = bundleUI.loadNibNamed(
            String(describing: viewType), owner: nil, options: nil)?.first as? T {
            return nib
        }
        return T()
    }
}

extension Double {
    
    func formatador() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.decimalSeparator = ","
        numberFormatter.groupingSeparator = "."
        let numero = NSNumber(value: self)
        let numeroFormatado = numberFormatter.string(from: numero) ?? ""
        return "$ \(numeroFormatado)"
    }
}
