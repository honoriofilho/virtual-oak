// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

let pokeapi: String = "https://pokeapi.co/api/v2/pokemon/"
let filePath = "/Users/user/.pokeDex.txt"

@main
struct Oak: ParsableCommand {
    
    static var configuration = CommandConfiguration(
        abstract: "Pokemon Pet Buddy",
        discussion: "O VirtualOak permite que você cuide do seu Pokemon diretamente do seu terminal, com ele, você poderá brincar com ser Pokemon, alimenta-lo, acompanhar o seu progresso e leva-lo à enfermeira Joy sempre que precisar. Além disso, é possível fazer batalhas amigáveis para treina-lo e (talvez) evolui-lo. Basta chamar o Professor Carvalho pelo seu terminal e informá-lo que tipo de interação você deseja ter com o seu monstrinho (e não esqueça de se despedir).",
        subcommands: [Init.self]
    )
    
    //mutating func run() throws {}
}

func obterBuddyValido() -> Int {
    while true {
        print("Por favor, digite o número correspondente ao pokemon que deseja escolher: ")
        if let input = readLine(), let numero = Int(input), (1...3).contains(numero) {
            return numero
        } else {
            print("Entrada inválida. Tente novamente.\n")
        }
    }
}

struct Init: ParsableCommand {
    
    //TODO: manipulacao de arquivo
    
    func run(){
        //let fileURL = URL(fileURLWithPath: "/Users/user/Documents/")
        //let contentDirectory = try! FileManager.default.contentsOfDirectory(at: fileURL, includingPropertiesForKeys: nil)
        //let validateArray = contentDirectory.map{$0.absoluteString}
        
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: filePath) {
            print("""
                  Sua jornada pokemon js foi iniciada!!!
                  Cheque como seu pokemon esta com um 'oak check'
                  """)
            
            return
        }
//        
        
        print("Saudações Treinador!\n")
        
        print("""
            Muito prazer em conhecê-lo,meu nome é professor carvalho
            estou aqui para ajuda-lo na sua jornada. Então qualquer coisa basta me chamar da seguinte forma:
            
            oak <subcomando> [option]
            
            Qualquer dúvida de como interagir basta colocar:
            
            oak --help
            
            Pressione enter para continuar...
            """)
        
        let continueText = readLine() ?? ""
        
        clearTerminalScreen()
        
        pokebals()

        let chooseBuddy = obterBuddyValido()
        
        clearTerminalScreen()
        
        print("Você escolheu o Pokemon: " + pokemons[chooseBuddy].especie.capitalized)
        showPokemons(buddy: chooseBuddy)
        
        print("Você deseja colocar um apelido no seu Pokemon? [S/N]")
        while (true){
            let selectNickname = readLine() ?? "N"
            
            if selectNickname.uppercased() == "N"{
                
                pokemons[chooseBuddy].nomeBuddy = pokemons[chooseBuddy].especie
                
                print("Nice! Dados de \(pokemons[chooseBuddy].nomeBuddy?.capitalized ?? "") adicionados na PokeDex")
                
                break
                
            }
            
            else if selectNickname.uppercased() == "S"{
                
                print("Qual o nome voce deseja colocar no seu Buddy? ")
                
                let nickname = readLine()
                
                pokemons[chooseBuddy].nomeBuddy = nickname
                
                print("Nice! Dados de \(pokemons[chooseBuddy].nomeBuddy?.capitalized ?? "") adicionados na PokeDex")
                
                break
                
            }
            else {
                print("Entrada invalida")
                print("Digite SIM (S) ou NAO (N)")
            }
        }
        
//        criarBancoDeDados(data: pokemons[chooseBuddy])
        saveData(fileURL, buddy: pokemons[chooseBuddy])
        readData(fileURL)
//        criarBasedeDados(buddy: pokemons[chooseBuddy], filePath: filePath)
//        checarBasedeDados()
        
        //        if let url = URL(string: pokeapi+chooseBuddy){
        //
        //            print("1")
        //            let session = URLSession.shared
        //
        //            let task = session.dataTask(with: url){data, response, error in
        //
        //                print("1")
        //                print(data)
        //                print(response)
        //                print(error)
        //
        //                if let error = error {
        //                    print("Erro: \(error)")
        //                    return
        //                }
        //
        //                print("1")
        //
        //
        //                guard let data = data else {
        //                    print("pokemon nao encontrado!!!")
        //
        //                    print("1")
        //
        //                    return
        //                }
        //
        //                if let reponseString = String(data:data, encoding: .utf8){
        //                    print("1")
        //
        //                    print("Resposta: \(reponseString)")
        //                }
        //            }
        //
        //            task.resume()
        //            print("1")
        //
        //        } else {
        //            print("erro aqui oh")
        //        }
        //    }
        //}        
    }
}

struct Check{
    
    
    
    func run(){
        
    }
}

struct Care{
    @Option(help: "Formas de se cuidar o seu pokemon")
    var careOption: String
    
    func run(){
        
    }
}
