/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Os tipos que estão de acordo com esse protocolo são classes que lidam com o data source e delegate de uma collection
protocol CollectionHandler: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    /// Registra uma célula
    /// - Parameter collection: collection que vai ser registrada
    func registerCell(in collection: UICollectionView)
}


extension CollectionHandler {
    
    /// Linka o data source e delegate na collection
    /// - Parameter collection: collection que vai ser linkada
    ///
    /// Essa função também faz o registro da célula
    func link(with view: CustomCollectionProtocol) {
        self.registerCell(in: view.collection)
        view.setCollectionHandler(with: self)
    }
}
