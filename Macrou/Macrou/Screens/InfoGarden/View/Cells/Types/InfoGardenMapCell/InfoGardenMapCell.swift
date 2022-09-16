/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import MapKit


/// O que essa classe faz?
class InfoGardenMapCell: UIView {
    
    /* MARK: - Atributos */

    // Views
    
    
    private let mapView: UIView = {
        let map = CustomViews.newView()
        
        map.backgroundColor = .brown
        return map
    }()
    
//    /// Mapa
//    private let mapView: MKMapView = {
//        let map = CustomViews.newMap()
//        
//        let initialPlace = CLLocationCoordinate2D(latitude: 0, longitude: 0)
//        let radius: CLLocationDistance = 1000
//        let region = MKCoordinateRegion(center: initialPlace, latitudinalMeters: radius, longitudinalMeters: radius)
//        
//        map.setRegion(region, animated: true)
//        return map
//    }()
    
    /// Endereço da rua
    private let addressLabel: UILabel = {
        let lbl = CustomViews.newLabel()
        lbl.layer.masksToBounds = true
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor(.viewBack)?.withAlphaComponent(0.6)
        return lbl
    }()
    
    
    // Outros
    
    /// Constraints dinâmicas que mudam de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
		
		
    
    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.setupViews()
        self.DADOS_TESTE()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    

    /* MARK: - Ciclo de Vida */
    
    public override func layoutSubviews() {
        super.layoutSubviews()
	      
        self.setupUI()
        self.setupStaticTexts()
        self.setupDynamicConstraints()
    }
    
    
    
    /* MARK: - Configurações */

    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(self.mapView)
        self.addSubview(self.addressLabel)
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        self.addressLabel.layer.cornerRadius = 10
    }
    
    
    /// Define os textos que são estáticos (os textos em si que vão sempre ser o mesmo)
    private func setupStaticTexts() {		
        self.addressLabel.setupText(with: FontInfo(
            fontSize: 20, weight: .regular
        ))
    }
	  
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() { 
        let lateral: CGFloat = 10

       
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
    
        self.dynamicConstraints = [
            self.mapView.topAnchor.constraint(equalTo: self.bottomAnchor),
            self.mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.mapView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
            self.addressLabel.heightAnchor.constraint(equalToConstant: 35),
            self.addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lateral),
            self.addressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -lateral),
            self.addressLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -lateral),
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
    
    
    private func DADOS_TESTE() {
        self.addressLabel.text = "R: Pacaratu, 66 - Parque Imperial, SP"
    }
}
