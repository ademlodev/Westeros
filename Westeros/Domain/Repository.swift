//
//  Repository.swift
//  Westeros
//
//  Created by Javi on 13/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

enum HouseEnum : Int {
    case Stark, Lannister, Targaryen;
    
    func house() -> String {
        switch (self) {
        case .Stark:
            return "Stark"
        case .Lannister:
            return "Lannister"
        case .Targaryen:
            return "Targaryen"
        default:
            return ""
        }
    }
    
    var houseName: String {
        get {
            return house()
        }
    }
}

final class Repository{
    static let local = LocalFactory()
    
}

protocol HouseFactory {
    typealias FilterHouse = (House) -> Bool
    typealias FilterSeason = (Season) -> Bool
    
    var houses: [House] {get}
    var seasons: [Season] {get}
    func house(named: String) -> House?
    func houseEnum(named: HouseEnum) -> House?
    func houses(filteredBy: FilterHouse) -> [House]
    func season(named: String) -> Season?
    func seasons(filteredBy: FilterSeason) -> [Season]
}

final class LocalFactory: HouseFactory {
    
    var houses: [House]{
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Lobo Hueargo")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Leon Rampante")
        let targaryenSigil = Sigil(image: UIImage(named:"targaryenSmall.jpg")!, description: "Dragón Tricéfalo")
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")! )
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        let robb = Person(name: "Robb",alias:"El joven lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyiron = Person(name: "Tyrion", alias:"El enano", house: lannisterHouse)
        let jaime = Person(name:"Jaime", alias: "El Matarreyes", house: targaryenHouse)
        let dani = Person(name:"Daenerys", alias: "Madre de dragones", house: targaryenHouse)
        
        starkHouse.add(person: arya)
        starkHouse.add(person: robb)
        lannisterHouse.add(person: tyiron)
        targaryenHouse.add(person: jaime)
        targaryenHouse.add(person: dani)
        
        return [starkHouse,lannisterHouse,targaryenHouse].sorted()
    }
    
    var seasons: [Season]{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        var dateEpisode = formatter.date(from: "2011/04/17")
        
        let season1 = Season(name: "Game of Thrones Season 1", releaseDate: dateEpisode!)
        let episode1x1 = Episode(title: "Winter Is Coming", emisionDate: dateEpisode!, season: season1, resumen: "In the Seven Kingdoms of Westeros, a soldier of the ancient Night's Watch order survives an attack by supernatural creatures known as the White Walkers, thought until now to be myth. He rushes to Castle Winterfell, which is ruled by Eddard ,Ned Stark, Warden of the North, who decapitates the soldier for deserting his post.")
        dateEpisode = formatter.date(from: "2011/04/24")
        let episode1x2 = Episode(title: "The Kingsroad", emisionDate: dateEpisode!, season: season1, resumen: "Having accepted his new role as the Hand of the King, Ned leaves Winterfell with his daughters Sansa and Arya, while Catelyn stays behind to tend to Bran. The unconscious Bran is attacked by an assassin, but his direwolf saves him. Catelyn decides to go to King's Landing to tell Ned about the attempt and suspected Lannister involvement.")
        season1.add(episode: episode1x1)
        season1.add(episode: episode1x2)
        
        dateEpisode = formatter.date(from: "2012/04/01")
        let season2 = Season(name: "Game of Thrones Season 2", releaseDate: dateEpisode!)
        let episode2x1 = Episode(title: "The North Remembers", emisionDate: dateEpisode!, season: season2, resumen: "To Cersei's dismay, Tyrion takes up his post as acting Hand at King's Landing. At Dragonstone, Stannis proclaims allegiance to Melisandre's new god and lays public claim to the Iron Throne, revealing Joffrey's bastardy. The latter orders the soldiers to slaughter Robert's bastards, one of whom named Gendry manages to escape King's Landing along with Arya. Having won three victories, Robb offers the Lannisters peace in exchange for the North's independence and Sansa's return, sending Theon to gain the support of Balon, his father, and Catelyn to seek alliance with Renly, who also claims the throne. Beyond the Wall, the Night's Watch finds shelter with Craster and his daughters/wives. In Essos, as her people slowly die in the Red Waste, Daenerys sends out riders for reconnaissance.")
        dateEpisode = formatter.date(from: "2012/04/08")
        let episode2x2 = Episode(title: "The Night Lands", emisionDate: dateEpisode!, season: season2, resumen: "Returning to his home of Pyke after nine years as the Starks' ward, Theon is reunited with his sister, Yara, and Balon, who despises Theon for his Northern ways and intends to win back his crown by force. Cersei rejects Robb's terms and Tyrion exiles Slynt, head of the Gold Cloaks, to the Wall, promoting Bronn to commander of the watch. On the road to the Wall, Arya reveals her true identity to Gendry. North of the Wall, Tarly is approached by one of Craster's daughters, Gilly, who is pregnant and fears for her unborn son; Snow is reluctant to help her despite Tarly's pleas. In the Red Waste, one of the horses returns to Daenerys with the severed head of its rider in a pouch, a message from one of her enemies. In Dragonstone, Davos, Stannis's henchman, recruits the pirate Salladhor Saan to Stannis' side, and the latter has sex with Melisandre to obtain the son his wife cannot give him. Snow discovers that Craster sacrifices his sons to the White Walkers; in response, Craster knocks Snow unconscious.")
        season2.add(episode: episode2x1)
        season2.add(episode: episode2x2)
        
        dateEpisode = formatter.date(from: "2013/03/31")
        let season3 = Season(name: "Game of Thrones Season 3", releaseDate: dateEpisode!)
        let episode3x1 = Episode(title: "Valar Dohaeris", emisionDate: dateEpisode!, season: season3, resumen: "Some of the Night's Watchmen, including Tarly and Mormont, survive the White Walkers' attack and pledge to return to the Wall to warn the Seven Kingdoms. Snow is brought before Rayder, the King beyond the Wall, and pledges his loyalty to the Wildlings. A scarred Tyrion tries to get Casterly Rock from Tywin, who promises other things instead. Margaery engages in charity work with the orphans of King's Landing. Baelish offers to help Sansa escape King's Landing. Ros advises Shae not to trust him. Davos is rescued by Saan, who does not want any more connections with Stannis, and returns to Dragonstone, where he unsuccessfully tries to kill Melisandre, who blames him for convincing Stannis not to let her join the battle, and is imprisoned. In Essos, Daenerys arrives in the city of Astapor to buy an army of brutally-trained slave soldiers, the Unsullied. The warlocks of Qarth attempt to assassinate her, but she is saved by Selmy, the former Kingsguard commander, who pledges his loyalty.")
        dateEpisode = formatter.date(from: "2013/04/07")
        let episode3x2 = Episode(title: "Dark Wings, Dark Words", emisionDate: dateEpisode!, season: season3, resumen: "Brienne continues escorting Jaime across the Riverlands to King's Landing. He engages her in a fight, which is interrupted by Bolton soldiers. After receiving the news of the sack of Winterfell and the disappearance of Bran and Rickon, Robb diverts his attentions from the war against the Lannisters to attend Catelyn's father's funeral in Riverrun, angering Karstark, who seeks vengeance for his sons who were killed by the Lannisters. Arya, Gendry and Hot Pie also make for Riverrun, but are waylaid by a rebel group, the Brotherhood without Banners, and are taken to an inn, where the captured Clegane reveals Arya's identity. Margaery and her grandmother Olenna, the Queen of Thorns, convince Sansa to tell them about Joffrey's flawed character. Theon is tortured by unknown captors. Bran, Rickon, Osha and Hodor encounter the siblings Jojen and Meera, children of the Stark bannerman Howland. Jojen, who has been sharing Bran's strange dreams, tells him that he is a warg, able to enter the minds of animals.")
        season3.add(episode: episode3x1)
        season3.add(episode: episode3x2)
        
        dateEpisode = formatter.date(from: "2014/04/06")
        let season4 = Season(name: "Game of Thrones Season 4", releaseDate: dateEpisode!)
        let episode4x1 = Episode(title: "Two Swords", emisionDate: dateEpisode!, season: season4, resumen: "Tywin oversees the reforging of Ice, the Stark ancestral sword, into two new swords, one for Jaime, who tries to deal with the loss of his sword hand and Cersei's love, and one for King Joffrey as a wedding present. Prince Oberyn Martell, on behalf of his brother, Prince Doran of Dorne, arrives in King's Landing with his paramour, Ellaria Sand, to attend the royal wedding and is welcomed by Tyrion. Oberyn openly reveals to Tyrion his motive for his visit: revenge against the Lannisters for the rape and murder of his sister, Elia, wife of Prince Rhaegar. In the North, while Styr and his group of cannibal Thenns reinforce Tormund, Ygritte, and the other wildlings, Jon is released by Maester Aemon after confessing what he did during his time with the wildlings to gain information. In the Riverlands, Arya and the Hound reclaim her sword, Needle, from Polliver, killing him and his men. In Essos, Daenerys leads her army on a march towards Meereen, the last of the three great slave cities, though she is troubled by how her dragons are becoming less tame as they grow.")
        dateEpisode = formatter.date(from: "2014/04/13")
        let episode4x2 = Episode(title: "The Lion and the Rose", emisionDate: dateEpisode!, season: season4, resumen: "Roose Bolton returns to the Dreadfort, where he blames Ramsay for mistreating Theon, who has been brutalized into a subservient persona called 'Reek'. The former decides to find and kill the remaining Stark children, Bran and Rickon, who threaten the legitimacy of his new title, while tasking Ramsay to reclaim the territories under Ironborn occupation. In Dragonstone, Melisandre orders several people to be burned as a tribute to the Lord of Light, to the delight of Queen Selyse and the disgust of Davos and Shireen. In King's Landing, Tyrion ends his relationship with Shae to protect her from his family and has her shipped off to Pentos. Jaime begins training his left-handed swordplay with the help of Bronn. King Joffrey and Margaery Tyrell are wed. Later, at the Royal Wedding feast, tensions between Joffrey and Tyrion grow—just before the former succumbs to poisoned wine and dies. A grief-stricken Cersei accuses Tyrion of the murder and has him arrested, while Ser Dontos, a former knight, advises Sansa to leave with him in order to survive.")
        season4.add(episode: episode4x1)
        season4.add(episode: episode4x2)
        
        dateEpisode = formatter.date(from: "2015/04/12")
        let season5 = Season(name: "Game of Thrones Season 5", releaseDate: dateEpisode!)
        let episode5x1 = Episode(title: "The Wars to Come", emisionDate: dateEpisode!, season: season5, resumen: "In a flashback, a witch tells a teenage Cersei that someone younger and more beautiful than herself will one day steal her accomplishments. In the present, Tywin is buried and Lancel returns, now a devoutly religious man and a member of the Sparrows. In Pentos, a despondent Tyrion agrees to accompany Varys to Meereen to support Daenerys's claim on the Iron Throne. In Meereen, the insurgent Sons of the Harpy murder an Unsullied, forcing Daenerys to launch more restrictive measures without respecting the old traditions. Missandei gets suspicious when she realizes that the Unsullied visit brothels. Daenerys's locked-away dragons attack her when she checks on them. In the Vale, Baelish puts Robin in the care of House Royce and leaves with Sansa. At the Wall, Stannis seeks to enlist the Wildlings in his war against Roose. Jon Snow is unable to convince Rayder to accept Stannis's authority. The latter has Mance burned alive, but Jon Snow mercifully shoots him with an arrow to kill him quickly.")
        dateEpisode = formatter.date(from: "2015/04/19")
        let episode5x2 = Episode(title: "The House of Black and White", emisionDate: dateEpisode!, season: season5, resumen: "Arya arrives in Braavos and is accepted into the House of Black and White by H'ghar, who calls himself and his colleagues no one. Jaime tells Cersei he is going to Dorne to sneak out Myrcella, who is promised to Prince Doran's son, and recruits Bronn to assist him; Podrick recognises Baelish and Sansa in a tavern; Brienne offers Sansa her protection, but is rebuffed. Baelish demands her to stay with them, but she refuses and escapes with Podrick. However, she decides to follow Sansa secretly. Stannis offers Snow legitimacy and lordship of Winterfell if he leaves the Night's Watch to help him, but Snow declines; Tarly nominates him as a candidate for Lord Commander, and he is elected by the casting vote of Aemon. Daenerys faces a riot after she decides to execute a former slave who murdered a captured member of the Sons of the Harpy before he could be tried. Drogon reappears to her, but leaves again.")
        season5.add(episode: episode5x1)
        season5.add(episode: episode5x2)
        
        dateEpisode = formatter.date(from: "2016/04/24")
        let season6 = Season(name: "Game of Thrones Season 6", releaseDate: dateEpisode!)
        let episode6x1 = Episode(title: "The Red Woman", emisionDate: dateEpisode!, season: season6, resumen: "Jon Snow's corpse is found by Ser Davos, Edd and a few other loyalists; Davos and the others take him inside and lock themselves behind a door with him, while Edd goes to get help. Thorne assumes command of the Watch. At Winterfell, Ramsay mourns for Myranda, while Sansa and Theon escape through the woods. Ramsay's men catch up with them, and are about to take them captive, when Brienne and Pod arrive, kill the men, and the former is accepted into Sansa's service. In King's Landing, Cersei receives Jaime, who arrives with Myrcella's body. Jaime promises Cersei they will take their revenge. Obara and Nymeria murder Trystane, on his way home from King's Landing, while in Sunspear, Doran and Areo Hotah are killed by Ellaria and Tyene, after the former learns of Myrcella's death. In Meereen, Tyrion and Varys find all the ships burning in the harbor. Jorah and Daario continue to track Daenerys, who is taken by the Dothraki to Khal Moro. In Braavos, Arya lives on the streets as a beggar, where she is beaten by the Waif. In her chamber, Melisandre removes her bejeweled necklace as she reveals her true appearance as an old crone.")
        dateEpisode = formatter.date(from: "2016/05/01")
        let episode6x2 = Episode(title: "Home", emisionDate: dateEpisode!, season: season6, resumen: "Brandon visits Winterfell in a vision of the past, and sees Eddard, Benjen, and their sister Lyanna, as well as a young Hodor. Edd arrives with Tormund and a group of Wildlings, imprisoning Thorne and the other mutineers. Tommen asks Cersei to teach him to be strong. Tyrion learns that Astapor and Yunkai have reverted to slavery, and releases Rhaegal and Viserion from their chains. In Braavos, Arya is attacked by the Waif before H'ghar appears and recruits her again. Walda, Roose's wife, gives birth to a boy, prompting Ramsay to murder Roose, her, and the baby. Brienne reveals to Sansa that Arya is still alive. Sansa permits Theon's return to the Iron Islands, where his uncle Euron reappears and murders King Balon. Davos persuades Melisandre to attempt to resurrect Jon. At first, her attempts seem to fail. However, once everyone leaves the room, he awakens.")
        season6.add(episode: episode6x1)
        season6.add(episode: episode6x2)
        
        dateEpisode = formatter.date(from: "2017/07/16")
        let season7 = Season(name: "Game of Thrones Season 7", releaseDate: dateEpisode!)
        let episode7x1 = Episode(title: "Dragonstone", emisionDate: dateEpisode!, season: season7, resumen: "At the Twins, Arya fatally poisons the remaining lords of House Frey. The White Walkers march toward the Wall, where Tollett allows Bran and Meera inside. At Winterfell, despite Sansa's disapproval, Jon secures the loyalties of Houses Umber and Karstark, who fought alongside Ramsay in the Battle of the Bastards. At the Citadel, Samwell steals books that reveal a large reservoir of dragonglass in Dragonstone, and sends word to Jon. He later finds Jorah in a cell. In the Riverlands, Arya meets a group of friendly Lannister soldiers, who take her intention to kill Cersei as a joke. Thoros shows Sandor a vision in the fire. The revelation leads him to believe in the Lord of Light. In King's Landing, Jaime tells Cersei of the crucial need for allies. She welcomes Euron, who proposes marriage to her in exchange for his Iron Fleet and a chance to kill Theon and Yara. Cersei declines citing trust as a concern, so Euron promises to return with a gift to prove his loyalty. Daenerys arrives at Dragonstone, the home of House Targaryen once occupied by Stannis, with her army and dragons.")
        dateEpisode = formatter.date(from: "2017/07/23")
        let episode7x2 = Episode(title: "Stormborn", emisionDate: dateEpisode!, season: season7, resumen: "Daenerys sends the Dornishmen with Yara's fleet to Sunspear and the Unsullied to Casterly Rock, deciding to place King's Landing under siege. She questions Varys' loyalty and threatens to burn him alive if he ever betrays her. Melisandre arrives and encourages her to invite Jon Snow to Dragonstone. Grey Worm and Missandei consummate their relationship. Cersei gathers several lords, asking for their fealties and elevating Randyll Tarly as Warden of the South. Qyburn shows Cersei a prototype ballista capable of harming dragons. Arya meets with Hot Pie and learns of Jon's ascension to King in the North, halting plans to travel to King's Landing and instead setting course for Winterfell. After receiving Samwell's letter, Jon leaves for Dragonstone in hopes of convincing Daenerys to support the fight against the White Walkers. He leaves Sansa in charge and aggressively warns Littlefinger to keep his distance. Samwell applies a forbidden treatment on Jorah's greyscale infection. Euron's fleet attacks Yara's. Obara and Nymeria are killed, while Ellaria, Tyene, and Yara are captured. Theon shows flashes of his time as Reek, hesitating to challenge Euron before fleeing the carnage by jumping into the sea.")
        season7.add(episode: episode7x1)
        season7.add(episode: episode7x2)
        
        return [season1,season2,season3,season4,season5,season6,season7].sorted()
    }
    
    func house(named name: String) -> House? {
        let house = houses.filter{ $0.name.uppercased() == name.uppercased() }.first
        return house
    }
    
    func houseEnum(named name: HouseEnum) -> House?{
        let house = houses.filter{ $0.name.uppercased() == name.house().uppercased() }.first
        return house
    }
    
    func houses(filteredBy: FilterHouse) -> [House] {
        return houses.filter(filteredBy)
    }
    
    func season(named name: String) -> Season? {
        let season = seasons.filter{ $0.name.uppercased() == name.uppercased() }.first
        return season
    }

    func seasons(filteredBy: FilterSeason) -> [Season] {
        return seasons.filter(filteredBy)
    }
}
