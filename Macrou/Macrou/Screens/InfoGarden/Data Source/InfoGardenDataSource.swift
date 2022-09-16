/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Data source da collection da tela de info garden
class InfoGardenDataSource: NSObject, UICollectionViewDataSource {
        
    /* MARK: - Data Source */
    
    /// Mostra quantas células vão ser mostradas
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    /// Faz a configuração de cada célula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoGardenCell.identifier, for: indexPath) as? InfoGardenCell else {
            return UICollectionViewCell()
        }
        
        switch indexPath.row {
        case 0: cell.setupCell(for: .report)
        case 1: cell.setupCell(for: .time)
        case 2: cell.setupCell(for: .contact)
        case 3: cell.setupCell(for: .report)
        default: break
        }
        
        return cell
    }
}
