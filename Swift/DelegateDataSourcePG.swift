import UIKit

//Delegate

struct FoodItem {
    let name: String
}

//Proto
//Delegates should not control what other classes are doing
//MenuSelectionDelegate can conform to any object
protocol MenuSelectionDelegate: AnyObject {
    func didSelectItem (with model: FoodItem)
}
//Proto
protocol MenuSelectionDataSource: AnyObject {
    func numberofMenuItems () -> Int {
        return 1
    }

    func item(for position:Int) -> FoodItem
}

//VC is a child of MenuSelectionDelegate, must have didSelectItem as function
class VC: UIViewController, MenuSelectionDelegate, MenuSelectionDatasource{
    //All the work will be delegated here


    func presentMenu (){
        //Delegate / DS
        let vc = MenuSelectionVC()
        //delegate is just a reference to the class who will conform to a protocol
        //Class VC is the owner of the delegate, delegate will represent this class
        vc.delegate = self
        vc.datasource = self
    }

    //Gets info frm the delegate didTapChickenNuggets
    func didSelectItem(with model: FoodItem) { // Second

    }

    func item(for position: Int) -> FoodItem {
        return FoodItem(name: "")
    }

    func numberofMenuItems () -> Int {
        return 1
    }

}

class MenuSelectionVC {

    //This is a delegate
    public weak var delegate: MenuSelectionDelegate?

    public weak var datasource = MenuSelectionDataSource?

    func didTapChickenNuggets(){
        delegate?.didSelectItem(with: FoodItem(name: "nuggets")) // First
    }

    func setupMenuView() {
        let itemCount: Int = datasource?.numberofMenuItems() ?? 0
    }
}