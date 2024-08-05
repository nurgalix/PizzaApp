//
//  Data.swift
//  PizzaApp
//
//  Created by Nurgali on 11.07.2024.
//

import Foundation

import UIKit
import SwiftUI


let swiftbook = Pizza(readyInMinutes: 10, sourceUrl: "asd", image: "asd", servings: 10, id: 10, title: "asdd", description: "asd")

let pizzaMain: PizzaResponse = load("pizzaMain.json")


let pizzasDetail: [PizzaDetail] = [
    PizzaDetail(cheap: true, veryPopular: true, preparationMinutes: 30, price: 20, title: "Plantain Pizza", image: "11", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent luctus erat non neque ornare iaculis. Cras in arcu felis. Etiam congue eu purus eget cursus. Suspendisse et orci at velit vehicula auctor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus in rhoncus ligula, at hendrerit eros. Mauris vestibulum pellentesque varius. Curabitur mauris magna, sagittis quis dapibus non, lacinia sodales nisl. Maecenas malesuada metus augue, a volutpat ligula rutrum eu.", cuisines: ["Chinese", "Japanese"]),
    PizzaDetail(cheap: true, veryPopular: false, preparationMinutes: 40, price: 23, title: "Tomato and Bacon Pizza With Rice Crust", image: "22", summary: "Vivamus convallis egestas rutrum. Proin tincidunt, arcu eget malesuada semper, tellus dolor bibendum sapien, ac tincidunt justo magna sit amet risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mollis nisl at magna tempus blandit. Praesent efficitur malesuada nisi vel consequat. Curabitur sed nibh condimentum felis maximus vestibulum. Sed dui elit, consequat in tristique non, gravida at lorem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent luctus erat non neque ornare iaculis. Cras in arcu felis. Etiam congue eu purus eget cursus. Suspendisse et orci at velit vehicula auctor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus in rhoncus ligula, at hendrerit eros. Mauris vestibulum pellentesque varius. Curabitur mauris magna, sagittis quis dapibus non, lacinia sodales nisl. Maecenas malesuada metus augue, a volutpat ligula rutrum eu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent luctus erat non neque ornare iaculis. Cras in arcu felis. Etiam congue eu purus eget cursus. Suspendisse et orci at velit vehicula auctor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus in rhoncus ligula, at hendrerit eros. Mauris vestibulum pellentesque varius. Curabitur mauris magna, sagittis quis dapibus non, lacinia sodales nisl. Maecenas malesuada metus augue, a volutpat ligula rutrum eu.", cuisines: ["Italian", "French"]),
    PizzaDetail(cheap: false, veryPopular: false, preparationMinutes: 45, price: 40, title: "Ultimate Christmas Fruit Pizza", image: "33", summary: "Etiam sed ex eget nulla euismod semper et ac ipsum. Nullam lobortis varius feugiat. Aenean non risus magna. Nam a sem non sapien bibendum feugiat. Suspendisse potenti. Donec nec congue leo, sit amet euismod ante. Praesent rutrum vehicula dolor, efficitur imperdiet metus auctor vitae. In quis lectus id massa elementum cursus.", cuisines: ["American", "Mexian"]),
    PizzaDetail(cheap: false, veryPopular: false, preparationMinutes: 35, price: 35, title: "Butternut Squash Pizza", image: "44", summary: "Suspendisse tempor eros non faucibus accumsan. Nam nunc lorem, faucibus id erat eu, vulputate efficitur quam. Duis id eros et eros congue imperdiet. Nullam vulputate eleifend neque, a viverra arcu ultrices quis. Sed ut commodo ex. Vivamus semper dapibus urna sed eleifend. Donec convallis vitae magna at ultricies. Cras maximus nisi quis iaculis eleifend.", cuisines: ["Russian", "Arab"]),
    PizzaDetail(cheap: true, veryPopular: true, preparationMinutes: 20, price: 23, title: "Rustic Grilled Peaches Pizza", image: "55", summary: "In venenatis ut mi eget sollicitudin. Etiam vitae condimentum nisl. Fusce a suscipit turpis, id imperdiet dolor. Ut eget lacinia magna. Etiam tincidunt eu velit ut commodo. Cras quis aliquet urna, sed luctus enim. Vestibulum ornare massa ac tortor elementum semper. In suscipit dapibus nisi, sed pellentesque ipsum rutrum quis. Phasellus sapien lorem, sagittis id maximus sed, viverra nec sem. Pellentesque fringilla, nisl vitae tincidunt pharetra, ante mauris eleifend elit, ac imperdiet ex magna quis magna. Curabitur vitae elit ornare, varius dui ut, tempus justo. Ut ut eros nibh. Nam placerat eu erat nec ornare.", cuisines: ["Turkish", "Kazakh"]),
    PizzaDetail(cheap: true, veryPopular: false, preparationMinutes: 25, price: 18, title: "Summer vegetable pizza", image: "66", summary: "Duis massa augue, vehicula vel suscipit et, pulvinar sagittis tellus. Quisque et dapibus erat. Morbi augue metus, vehicula sit amet facilisis in, hendrerit eget magna. Sed id eros consectetur, consequat felis non, gravida sem. Duis gravida metus at sem pretium, et elementum ligula venenatis. Integer elit magna, aliquet sit amet odio nec, lacinia dictum diam. Donec eleifend nec libero sed gravida. Praesent id nisi porttitor, dictum metus tristique, convallis sem. Nunc sit amet convallis sapien. Morbi vel lacus ut turpis finibus aliquam at vel ex.", cuisines: ["Greek", "Spanish"]),
    PizzaDetail(cheap: false, veryPopular: false, preparationMinutes: 50, price: 33, title: "Multigrain Tandoori Pizza With Paneer Tikka", image: "77", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ut nulla eget ante eleifend mollis. Duis eu rhoncus nunc. Donec cursus, erat ac fringilla porttitor, risus urna vulputate purus, vel pulvinar odio leo quis turpis. Curabitur imperdiet, nisi sed tincidunt rhoncus, nulla nisi tempus diam, non tincidunt est enim vitae felis. Mauris ut massa nec augue hendrerit convallis eu in nunc. Etiam sed lacinia mi, non imperdiet ex. Praesent eget erat ut lorem tempor tempus. Aliquam tempor libero vitae viverra varius. In eleifend in nulla a finibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur enim mi, euismod in ex non, commodo euismod purus.", cuisines: ["Korean", "Thai"]),
    PizzaDetail(cheap: false, veryPopular: true, preparationMinutes: 45, price: 30, title: "Italian Sausage Pizza", image: "88", summary: "Sed eget dui arcu. Aliquam eu iaculis dui. Nam at est neque. Aenean pellentesque ut dui non convallis. Nullam luctus, quam vel iaculis vulputate, tellus orci ultricies metus, porttitor tincidunt nibh quam sed lectus. Vestibulum non massa magna. Nam quis tincidunt arcu. Nullam vulputate condimentum condimentum. Vestibulum fermentum urna vitae tempor hendrerit. Maecenas leo elit, tincidunt vel cursus id, congue nec neque.", cuisines: ["Italian"]),
    PizzaDetail(cheap: true, veryPopular: true, preparationMinutes: 40, price: 25, title: "Thin Crust Genoa Salami Pizza", image: "99", summary: "Etiam bibendum quam in vestibulum auctor. Fusce vel gravida nisl. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mollis sollicitudin tristique. Aliquam odio felis, condimentum vitae convallis quis, suscipit ac mauris. Fusce posuere risus sed diam iaculis, consectetur molestie velit maximus. Donec bibendum neque ut tellus auctor ornare. Vestibulum at sagittis risus, eget varius ipsum.", cuisines: ["Vietnamese", "Japanese"]),
    PizzaDetail(cheap: true, veryPopular: true, preparationMinutes: 30, price: 15, title: "Sweet Potato Pizza", image: "100", summary: "Sed eu ante eu purus consequat lobortis quis eu quam. Curabitur ac purus imperdiet, scelerisque enim id, efficitur risus. Nunc tempus neque tincidunt maximus elementum. Curabitur dapibus urna velit, at posuere massa egestas ut. In posuere eu ipsum sit amet consectetur. Nam sed auctor sapien, ac malesuada odio. Sed pretium mauris at eros molestie, sed vehicula tellus consequat. Proin hendrerit a est at luctus. Integer laoreet egestas convallis. ", cuisines: ["Indian", "French"])]


func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
