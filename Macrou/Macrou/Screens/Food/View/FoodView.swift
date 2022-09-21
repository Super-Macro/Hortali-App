/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// UI da tela de ver todas os alimentos
class FoodView: MainView {
    
    /* MARK: - Atributos */
    
    // Views
    
    /// Controle das views segmentadas para os diferentes tipos de alimentos
    private let foodSegmented: UISegmentedControl = CustomViews.newSegmentation(with: ["Frutas", "Legumes", "Vegetais", "Ervas"])
    
    /// Grupo da collection de alimentos
    private let foodGroup: CollectionGroup = {
        let group = CollectionGroup()
        group.collection.showsVerticalScrollIndicator = false
        
        return group
    }()
    
    
    // Outros
    
    /// Constraints dinâmicas que mudam de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
		
    /// Configurações do layout da collection
    private let collectionFlow: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .vertical
		     
        return cvFlow
    }()



    /* MARK: - Construtor */
    
    override init() {
        super.init()
        
        self.setupViews()
        self.registerCells()
        self.setupCollectionFlow()
    }
    
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}

    
    
    /* MARK: - Encapsulamento */
    
    /// Define o data source da collection de alimentos
    /// - Parameter dataSource: data source
    public func setDataSource(with dataSource: FoodCollectionDataSource) {
        self.foodGroup.collection.dataSource = dataSource
    }
    

    /* MARK: - Ciclo de Vida */
    
    override internal func layoutSubviews() {
        super.layoutSubviews()
	      
        self.setupUI()
        self.setupStaticTexts()
        self.setupDynamicConstraints()
    }
    
    
    
    /* MARK: - Configurações */
    
    /// Registra as células nas collections/table
    private func registerCells() {
        self.foodGroup.collection.register(FoodCell.self, forCellWithReuseIdentifier: FoodCell.identifier)
    }


    /// Define o layout da collection
    private func setupCollectionFlow() {
         self.foodGroup.collection.collectionViewLayout = self.collectionFlow
    }

    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(self.foodSegmented)
        self.addSubview(self.foodGroup)
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        self.collectionFlow.itemSize = CGSize(
            width: self.getEquivalent(170),
            height: self.getEquivalent(192)
        )
    }
    
    
    /// Define os textos que são estáticos (os textos em si que vão sempre ser o mesmo)
    private func setupStaticTexts() {		
        self.setTitleText(with: "Hora da sua\ncolheita")
    }
	  
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() { 
        let lateral: CGFloat = self.getEquivalent(15)
        let between: CGFloat = self.getEquivalent(20)
       
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
    
        self.dynamicConstraints = [
            self.foodSegmented.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: lateral),
            self.foodSegmented.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.foodSegmented.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -lateral),
            self.foodSegmented.heightAnchor.constraint(equalToConstant: lateral * 2),
            
            
            self.foodGroup.collection.topAnchor.constraint(equalTo: self.foodSegmented.bottomAnchor, constant: between),
            self.foodGroup.collection.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.foodGroup.collection.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -lateral),
            self.foodGroup.collection.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
