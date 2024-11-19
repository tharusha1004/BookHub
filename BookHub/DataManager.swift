//
//  File.swift
//  BookHub
//
//  Created by mac on 2024-11-19.
//

import Foundation

struct Category{
    var name: String
    var books: [Book]
}

struct Book{
    var title: String
    var imageName: String
    var rating: Double
    var description: String
    var story: String
}

class DataManager{
    static let shared = DataManager()
    
    let categories: [Category] = [
           Category(name: "All", books: [
                Book(title: "Silent Woods", imageName: "01", rating: 4.2, description: "A gripping psychological thriller set in a secluded forest.", story: "Alan, a renowned psychologist, isolates himself in the Silent Woods after his wife’s mysterious death. But as he begins to hear her voice, he discovers an old journal in the cabin. The journal hints at a chilling experiment conducted in these woods. As Alan unravels the entries, the boundary between reality and delusion begins to blur. Are the whispers in the woods the remnants of a tormented mind or something far more sinister? The journey leads Alan to a hidden facility where he confronts the terrifying truth about his own past."),
                Book(title: "Dreamcatcher", imageName: "02", rating: 4.5, description: "A tale of dreams intertwined with reality.", story: "Emma, a struggling artist, buys an antique dreamcatcher at a flea market. That night, she dreams of a man trapped in a burning house. She wakes up to discover news of a man saved from a fire, matching her dream exactly. As Emma begins to experience increasingly vivid dreams of strangers in peril, she realizes that the dreamcatcher is a bridge between her and the unseen. But saving lives comes at a cost—each rescue drains her strength. Emma must confront the dreamcatcher's origin to prevent her own demise."),
                Book(title: "Lost Chronicles", imageName: "03", rating: 4.3, description: "An epic saga of kingdoms and warriors.", story: "In the land of Eryndor, where ancient prophecies shape the fate of kingdoms, Prince Kael discovers a hidden chronicle that foretells the return of an ancient evil. As war brews among rival clans, Kael must unite the divided kingdoms to face a common enemy—the Shadow King. Along the way, he encounters a brave warrior, an enigmatic seer, and a reluctant thief, each with a role in the prophecy. With time running out, Kael embarks on a perilous journey to uncover the secrets of the Lost Chronicles and awaken the long-forgotten Guardians."),
                Book(title: "Midnight Caller", imageName: "04", rating: 4.0, description: "A mysterious voice on the radio changes lives.", story: "A late-night radio show host, Jake, receives a call from a listener who claims to be from the future. The caller warns him of an impending disaster—a bridge collapse that will take dozens of lives. At first skeptical, Jake investigates and finds evidence supporting the claim. As more calls come in, each predicting a tragedy, Jake becomes entangled in a race against time to prevent the events. But who is the Midnight Caller, and why is Jake the one chosen to rewrite fate."),
                Book(title: "Whispered Secrets", imageName: "06", rating: 4.6, description: "An investigator uncovers secrets buried for decades.", story: "Detective Mark Winters is on the trail of a serial arsonist terrorizing the city. The only clue is a symbol left at each crime scene—a crescent moon drawn in ash. As Mark investigates, he discovers a connection to a decades-old cold case involving his late father. With mounting pressure and personal stakes, Mark races to uncover the arsonist’s identity. The hunt leads him to a shocking discovery about betrayal, family, and revenge."),
                Book(title: "Dark Alley", imageName: "07", rating: 4.3, description: "A detective’s hunt for a serial criminal.", story: "Detective Mark Winters is on the trail of a serial arsonist terrorizing the city. The only clue is a symbol left at each crime scene—a crescent moon drawn in ash. As Mark investigates, he discovers a connection to a decades-old cold case involving his late father. With mounting pressure and personal stakes, Mark races to uncover the arsonist’s identity. The hunt leads him to a shocking discovery about betrayal, family, and revenge."),
                Book(title: "Silent Evidence", imageName: "08", rating: 4.0, description: "A courtroom drama with shocking twists.", story: "When a small-town lawyer, Clara Davis, takes on a seemingly straightforward case involving a missing woman, she discovers evidence that points to a powerful corporate conspiracy. As she delves deeper, witnesses begin to disappear, and her own life is threatened. The evidence she uncovers reveals not only the truth about the woman’s disappearance but also dark secrets about the town’s most respected leaders. In a courtroom showdown, Clara must outsmart a ruthless defense team and expose the silent forces pulling the strings before justice is silenced forever."),
                Book(title: "Foggy Clues", imageName: "09", rating: 4.2, description: "Unraveling clues hidden in foggy streets.", story: "In the fog-drenched streets of London, retired detective Arthur Bennett is pulled back into the world of crime when a cryptic letter arrives at his doorstep. The letter contains a riddle that leads to the site of an unsolved murder from years ago. As Arthur follows the trail of riddles, he realizes they are all connected to a string of cold cases he once worked on. But someone is watching his every move, determined to keep the truth buried in the fog. Arthur must rely on his wits and instincts to uncover the killer before he becomes the final victim."),
                Book(title: "Autumn Embrace", imageName: "11", rating: 4.7, description: "A heartwarming story of love and loss.", story: "When Emily returns to her hometown after years away, she encounters Jake, her childhood best friend, now a reclusive widower. As the golden hues of autumn surround them, Emily and Jake begin to rebuild their friendship. Old feelings resurface, but both are haunted by the ghosts of their past. Through shared memories and new experiences, they find the strength to let go of their pain and rediscover love. Together, they learn that sometimes, letting go is the only way to hold on to what truly matters."),
                Book(title: "Starry Nights", imageName: "12", rating: 4.5, description: "A chance encounter under a sky full of stars.", story: "On a solo camping trip in the mountains, aspiring writer Lila meets Ethan, a stargazer searching for a rare comet. Over a series of starlit nights, they share stories, dreams, and secrets. But as the comet’s arrival approaches, Lila learns that Ethan is battling a terminal illness and has made this journey to fulfill his final wish. Their fleeting romance inspires Lila to live her life boldly and write the story of their unforgettable nights under the stars."),
                Book(title: "Love's Compass", imageName: "13", rating: 4.6, description: "Navigating the ups and downs of love.", story: "Amelia, a travel photographer, discovers an old compass in her late grandmother’s belongings. Intrigued, she follows the directions scribbled in the margins of her grandmother’s diary, leading her to a series of small towns across Europe. Along the way, she keeps crossing paths with Julian, a charming historian on a quest of his own. As they navigate breathtaking landscapes and uncover hidden histories, they find themselves drawn together by fate. But when Amelia discovers a secret that ties Julian to her family’s past, their budding romance is tested in unexpected ways."),
                Book(title: "Rose Petals", imageName: "14", rating: 4.8, description: "A timeless love story in a blossoming garden.", story: "In a bustling flower shop in Paris, shy botanist Sophie meets Lucas, an ambitious architect, who visits daily to buy roses for his dying mother. Over time, their shared love for flowers brings them closer, and Lucas opens up about his struggles to balance his career and his mother’s care. As Sophie helps Lucas create a breathtaking rose garden as a tribute to his mother, their bond deepens. But when a job opportunity threatens to take Lucas across the globe, they must decide if their love can survive the distance."),
                Book(title: "Bullet Chase", imageName: "16", rating: 4.2, description: "A rogue agent on a deadly mission.", story: "Former CIA agent Lucas Kane is drawn back into the world of espionage when his estranged sister is kidnapped by a powerful cartel. To save her, Lucas must infiltrate a heavily fortified compound and retrieve stolen intelligence. With every step, Lucas uncovers a larger conspiracy involving corrupt officials and international arms dealers. Armed with his wits and skills, Lucas embarks on a bullet-riddled chase across continents, fighting not only for his sister’s life but for the truth that could shake governments to their core."),
                Book(title: "Steel Resolve", imageName: "17", rating: 4.4, description: "A gladiator’s fight for freedom.", story: "In the brutal arenas of Aethernix, slaves are forced to fight to the death for the entertainment of the elite. Darius, a once-proud warrior, is betrayed by his king and sold into slavery. Fueled by rage and a thirst for justice, Darius rises through the ranks of the gladiators, earning the support of the oppressed masses. With the help of a cunning ally, he leads a rebellion against the tyrannical regime, transforming the arenas into the stage for a revolution that will decide the fate of the kingdom."),
                Book(title: "Skybound", imageName: "18", rating: 4.5, description: "A high-octane aerial battle.", story: "In a world where airships dominate the skies, captain Elise Hart commands the Phoenix, a legendary airship known for its speed and firepower. When a rival captain steals a powerful relic that could destabilize the world’s fragile peace, Elise and her crew embark on a daring mission to retrieve it. Chased by mercenaries and rival factions, the Phoenix becomes the battleground for epic aerial dogfights. Elise must outmaneuver her enemies and face her greatest fear to save the skies she calls home."),
                Book(title: "Urban Warfare", imageName: "19", rating: 4.3, description: "Street-level action and explosive drama.", story: "In a crime-ridden city where corruption runs deep, former soldier Ryan Kane returns home to find his neighborhood overrun by gangs. Using his military training, Ryan takes on the mantle of a vigilante to clean up the streets. With the help of an idealistic journalist and a tech-savvy hacker, he uncovers a conspiracy that links the gangs to powerful political figures. As the stakes rise, Ryan must confront his own past and decide how far he’s willing to go to protect the people he loves."),
                Book(title: "Laugh Out Loud", imageName: "21", rating: 4.3, description: "A collection of hilarious tales.", story: "A group of misfit roommates decides to enter a local comedy contest to save their apartment from eviction. From disastrous open mic nights to pranking each other during practice, their journey is filled with laugh-out-loud moments. But as the competition heats up, their antics begin to test their friendship. Through awkward encounters and side-splitting mishaps, the roommates discover that the best humor comes from the heart—and the unexpected."),
                Book(title: "Clown Town", imageName: "22", rating: 4.2, description: "A small town with big laughs.", story: "In Clown Town, a quirky village where everyone takes clowning seriously, an annual pie-throwing competition spirals into chaos when someone replaces the pies with balloons filled with glitter. Charlie, an aspiring clown with a fear of glitter, teams up with eccentric townsfolk to find the culprit. Along the way, they encounter hysterical mishaps, including a runaway unicycle and a squirrel invasion. As the competition looms, Charlie learns that being a clown isn’t about perfection—it’s about embracing the chaos and making people laugh."),
                Book(title: "Quirky Chronicles", imageName: "23", rating: 4.4, description: "Funny adventures in everyday life.", story: "Alex, a daydreaming office worker, spends his days imagining absurd scenarios about his coworkers. From an epic food fight in the breakroom to a dance-off with the boss, Alex’s inner world is far more entertaining than reality. But when his wild imagination accidentally inspires a real-life company-wide prank war, chaos ensues. Through the madness, Alex learns that sometimes, life can be just as hilarious as the stories in his head."),
                Book(title: "Prank Wars", imageName: "24", rating: 4.1, description: "Friends turned pranksters.", story: "Best friends Mia and Jake are known for their friendly pranks, but things escalate when they challenge each other to a prank war at their college. From rigged vending machines to epic classroom stunts, their rivalry grabs the attention of the entire campus. However, as the pranks grow more elaborate, their friendship starts to falter. When one prank goes too far, Mia and Jake must work together to undo the damage and rediscover the fun in their friendship.")
           ]),
           
           
           Category(name: "Fiction", books: [
               Book(title: "Silent Woods", imageName: "01", rating: 4.2, description: "A gripping psychological thriller set in a secluded forest.", story: "Alan, a renowned psychologist, isolates himself in the Silent Woods after his wife’s mysterious death. But as he begins to hear her voice, he discovers an old journal in the cabin. The journal hints at a chilling experiment conducted in these woods. As Alan unravels the entries, the boundary between reality and delusion begins to blur. Are the whispers in the woods the remnants of a tormented mind or something far more sinister? The journey leads Alan to a hidden facility where he confronts the terrifying truth about his own past."),
               Book(title: "Dreamcatcher", imageName: "02", rating: 4.5, description: "A tale of dreams intertwined with reality.", story: "Emma, a struggling artist, buys an antique dreamcatcher at a flea market. That night, she dreams of a man trapped in a burning house. She wakes up to discover news of a man saved from a fire, matching her dream exactly. As Emma begins to experience increasingly vivid dreams of strangers in peril, she realizes that the dreamcatcher is a bridge between her and the unseen. But saving lives comes at a cost—each rescue drains her strength. Emma must confront the dreamcatcher's origin to prevent her own demise."),
               Book(title: "Lost Chronicles", imageName: "03", rating: 4.3, description: "An epic saga of kingdoms and warriors.", story: "In the land of Eryndor, where ancient prophecies shape the fate of kingdoms, Prince Kael discovers a hidden chronicle that foretells the return of an ancient evil. As war brews among rival clans, Kael must unite the divided kingdoms to face a common enemy—the Shadow King. Along the way, he encounters a brave warrior, an enigmatic seer, and a reluctant thief, each with a role in the prophecy. With time running out, Kael embarks on a perilous journey to uncover the secrets of the Lost Chronicles and awaken the long-forgotten Guardians."),
               Book(title: "Midnight Caller", imageName: "04", rating: 4.0, description: "A mysterious voice on the radio changes lives.", story: "A late-night radio show host, Jake, receives a call from a listener who claims to be from the future. The caller warns him of an impending disaster—a bridge collapse that will take dozens of lives. At first skeptical, Jake investigates and finds evidence supporting the claim. As more calls come in, each predicting a tragedy, Jake becomes entangled in a race against time to prevent the events. But who is the Midnight Caller, and why is Jake the one chosen to rewrite fate.")
           ]),
           
           Category(name: "Mystery", books: [
               Book(title: "Whispered Secrets", imageName: "06", rating: 4.6, description: "An investigator uncovers secrets buried for decades.", story: "Detective Mark Winters is on the trail of a serial arsonist terrorizing the city. The only clue is a symbol left at each crime scene—a crescent moon drawn in ash. As Mark investigates, he discovers a connection to a decades-old cold case involving his late father. With mounting pressure and personal stakes, Mark races to uncover the arsonist’s identity. The hunt leads him to a shocking discovery about betrayal, family, and revenge."),
               Book(title: "Dark Alley", imageName: "07", rating: 4.3, description: "A detective’s hunt for a serial criminal.", story: "Detective Mark Winters is on the trail of a serial arsonist terrorizing the city. The only clue is a symbol left at each crime scene—a crescent moon drawn in ash. As Mark investigates, he discovers a connection to a decades-old cold case involving his late father. With mounting pressure and personal stakes, Mark races to uncover the arsonist’s identity. The hunt leads him to a shocking discovery about betrayal, family, and revenge."),
               Book(title: "Silent Evidence", imageName: "08", rating: 4.0, description: "A courtroom drama with shocking twists.", story: "When a small-town lawyer, Clara Davis, takes on a seemingly straightforward case involving a missing woman, she discovers evidence that points to a powerful corporate conspiracy. As she delves deeper, witnesses begin to disappear, and her own life is threatened. The evidence she uncovers reveals not only the truth about the woman’s disappearance but also dark secrets about the town’s most respected leaders. In a courtroom showdown, Clara must outsmart a ruthless defense team and expose the silent forces pulling the strings before justice is silenced forever."),
               Book(title: "Foggy Clues", imageName: "09", rating: 4.2, description: "Unraveling clues hidden in foggy streets.", story: "In the fog-drenched streets of London, retired detective Arthur Bennett is pulled back into the world of crime when a cryptic letter arrives at his doorstep. The letter contains a riddle that leads to the site of an unsolved murder from years ago. As Arthur follows the trail of riddles, he realizes they are all connected to a string of cold cases he once worked on. But someone is watching his every move, determined to keep the truth buried in the fog. Arthur must rely on his wits and instincts to uncover the killer before he becomes the final victim.")
           ]),
           
           Category(name: "Romance", books: [
               Book(title: "Autumn Embrace", imageName: "11", rating: 4.7, description: "A heartwarming story of love and loss.", story: "When Emily returns to her hometown after years away, she encounters Jake, her childhood best friend, now a reclusive widower. As the golden hues of autumn surround them, Emily and Jake begin to rebuild their friendship. Old feelings resurface, but both are haunted by the ghosts of their past. Through shared memories and new experiences, they find the strength to let go of their pain and rediscover love. Together, they learn that sometimes, letting go is the only way to hold on to what truly matters."),
               Book(title: "Starry Nights", imageName: "12", rating: 4.5, description: "A chance encounter under a sky full of stars.", story: "On a solo camping trip in the mountains, aspiring writer Lila meets Ethan, a stargazer searching for a rare comet. Over a series of starlit nights, they share stories, dreams, and secrets. But as the comet’s arrival approaches, Lila learns that Ethan is battling a terminal illness and has made this journey to fulfill his final wish. Their fleeting romance inspires Lila to live her life boldly and write the story of their unforgettable nights under the stars."),
               Book(title: "Love's Compass", imageName: "13", rating: 4.6, description: "Navigating the ups and downs of love.", story: "Amelia, a travel photographer, discovers an old compass in her late grandmother’s belongings. Intrigued, she follows the directions scribbled in the margins of her grandmother’s diary, leading her to a series of small towns across Europe. Along the way, she keeps crossing paths with Julian, a charming historian on a quest of his own. As they navigate breathtaking landscapes and uncover hidden histories, they find themselves drawn together by fate. But when Amelia discovers a secret that ties Julian to her family’s past, their budding romance is tested in unexpected ways."),
               Book(title: "Rose Petals", imageName: "14", rating: 4.8, description: "A timeless love story in a blossoming garden.", story: "In a bustling flower shop in Paris, shy botanist Sophie meets Lucas, an ambitious architect, who visits daily to buy roses for his dying mother. Over time, their shared love for flowers brings them closer, and Lucas opens up about his struggles to balance his career and his mother’s care. As Sophie helps Lucas create a breathtaking rose garden as a tribute to his mother, their bond deepens. But when a job opportunity threatens to take Lucas across the globe, they must decide if their love can survive the distance.")
           ]),
           
           Category(name: "Action", books: [
               Book(title: "Bullet Chase", imageName: "16", rating: 4.2, description: "A rogue agent on a deadly mission.", story: "Former CIA agent Lucas Kane is drawn back into the world of espionage when his estranged sister is kidnapped by a powerful cartel. To save her, Lucas must infiltrate a heavily fortified compound and retrieve stolen intelligence. With every step, Lucas uncovers a larger conspiracy involving corrupt officials and international arms dealers. Armed with his wits and skills, Lucas embarks on a bullet-riddled chase across continents, fighting not only for his sister’s life but for the truth that could shake governments to their core."),
               Book(title: "Steel Resolve", imageName: "17", rating: 4.4, description: "A gladiator’s fight for freedom.", story: "In the brutal arenas of Aethernix, slaves are forced to fight to the death for the entertainment of the elite. Darius, a once-proud warrior, is betrayed by his king and sold into slavery. Fueled by rage and a thirst for justice, Darius rises through the ranks of the gladiators, earning the support of the oppressed masses. With the help of a cunning ally, he leads a rebellion against the tyrannical regime, transforming the arenas into the stage for a revolution that will decide the fate of the kingdom."),
               Book(title: "Skybound", imageName: "18", rating: 4.5, description: "A high-octane aerial battle.", story: "In a world where airships dominate the skies, captain Elise Hart commands the Phoenix, a legendary airship known for its speed and firepower. When a rival captain steals a powerful relic that could destabilize the world’s fragile peace, Elise and her crew embark on a daring mission to retrieve it. Chased by mercenaries and rival factions, the Phoenix becomes the battleground for epic aerial dogfights. Elise must outmaneuver her enemies and face her greatest fear to save the skies she calls home."),
               Book(title: "Urban Warfare", imageName: "19", rating: 4.3, description: "Street-level action and explosive drama.", story: "In a crime-ridden city where corruption runs deep, former soldier Ryan Kane returns home to find his neighborhood overrun by gangs. Using his military training, Ryan takes on the mantle of a vigilante to clean up the streets. With the help of an idealistic journalist and a tech-savvy hacker, he uncovers a conspiracy that links the gangs to powerful political figures. As the stakes rise, Ryan must confront his own past and decide how far he’s willing to go to protect the people he loves.")
           ]),
           
           Category(name: "Comedy", books: [
               Book(title: "Laugh Out Loud", imageName: "21", rating: 4.3, description: "A collection of hilarious tales.", story: "A group of misfit roommates decides to enter a local comedy contest to save their apartment from eviction. From disastrous open mic nights to pranking each other during practice, their journey is filled with laugh-out-loud moments. But as the competition heats up, their antics begin to test their friendship. Through awkward encounters and side-splitting mishaps, the roommates discover that the best humor comes from the heart—and the unexpected."),
               Book(title: "Clown Town", imageName: "22", rating: 4.2, description: "A small town with big laughs.", story: "In Clown Town, a quirky village where everyone takes clowning seriously, an annual pie-throwing competition spirals into chaos when someone replaces the pies with balloons filled with glitter. Charlie, an aspiring clown with a fear of glitter, teams up with eccentric townsfolk to find the culprit. Along the way, they encounter hysterical mishaps, including a runaway unicycle and a squirrel invasion. As the competition looms, Charlie learns that being a clown isn’t about perfection—it’s about embracing the chaos and making people laugh."),
               Book(title: "Quirky Chronicles", imageName: "23", rating: 4.4, description: "Funny adventures in everyday life.", story: "Alex, a daydreaming office worker, spends his days imagining absurd scenarios about his coworkers. From an epic food fight in the breakroom to a dance-off with the boss, Alex’s inner world is far more entertaining than reality. But when his wild imagination accidentally inspires a real-life company-wide prank war, chaos ensues. Through the madness, Alex learns that sometimes, life can be just as hilarious as the stories in his head."),
               Book(title: "Prank Wars", imageName: "24", rating: 4.1, description: "Friends turned pranksters.", story: "Best friends Mia and Jake are known for their friendly pranks, but things escalate when they challenge each other to a prank war at their college. From rigged vending machines to epic classroom stunts, their rivalry grabs the attention of the entire campus. However, as the pranks grow more elaborate, their friendship starts to falter. When one prank goes too far, Mia and Jake must work together to undo the damage and rediscover the fun in their friendship.")
           ])
    ]
    
    
    var mostreadBook: [Book] = [
               Book(title: "Timeless Echoes", imageName: "26", rating: 4.9, description: "A gripping novel about human connections.", story: "When historian Evelyn Gray discovers an ancient pocket watch that mysteriously runs backward, she is transported to pivotal moments in history each time she winds it. From Victorian England to ancient Egypt, Evelyn witnesses key events and uncovers forgotten truths about humanity. However, she soon realizes the watch has a darker purpose—it is rewriting history itself. As the echoes of time threaten to unravel reality, Evelyn must decide whether to sacrifice her only way home or risk altering the world forever."),
               Book(title: "Shadows of Fate", imageName: "27", rating: 4.8, description: "Exploring destiny through the eyes of a wanderer.", story: "In a world where everyone’s fate is predetermined by shadowy figures known as Weavers, young orphan Kael stumbles upon a forbidden loom that allows him to rewrite his destiny. As Kael manipulates the threads of fate, he discovers the devastating consequences of his actions—entire lives are altered, and a dark force is unleashed. Hunted by the Weavers, Kael teams up with an enigmatic rebel who has her own score to settle. Together, they must face their intertwined destinies and confront the shadows that threaten to consume their world."),
               Book(title: "Infinity Loop", imageName: "28", rating: 4.7, description: "A thrilling race against time.", story: "Scientist Nora Ellis invents the Infinity Loop, a machine that allows users to travel through alternate dimensions. However, when her prototype malfunctions, she becomes trapped in a repeating cycle of apocalyptic worlds. With each iteration, Nora discovers a clue about the machine’s true purpose—it was never meant to save the future but to destroy it. Racing against time and her own deteriorating health, Nora must break the loop and find her way back to her original dimension before it’s too late."),
               Book(title: "Dreamers' Odyssey", imageName: "29", rating: 4.8, description: "Unveiling dreams with life-changing power.", story: "When shy artist Leo falls into a coma, he wakes up in the Dreamscape, a vivid world shaped by the dreams and nightmares of humanity. In this realm, he meets an adventurous dreamer named Kaia, who is searching for her lost brother. Together, they journey through surreal landscapes and battle sinister forces intent on turning dreams into eternal nightmares. As Leo uncovers hidden truths about his own past, he must harness his creativity to defeat the darkness and guide himself—and Kaia—back to reality."),
               Book(title: "Waves of Wisdom", imageName: "30", rating: 4.9, description: "A tale of self-discovery by the ocean.", story: "After a devastating personal loss, marine biologist Asha retreats to a small coastal village to heal. While studying the mysterious behavior of dolphins in the area, she befriends an elderly fisherman, Elias, who shares profound wisdom from his years at sea. Through their conversations, Asha begins to see parallels between the ocean’s rhythms and life’s struggles. When a massive storm threatens the village, Asha and Elias work together to protect the community. In the process, Asha learns to embrace change and find purpose in the face of adversity.")
    ]
        
}
