# This is a simple program that get a random tip from:
# https://www.lesswrong.com/posts/7hFeMWC6Y5eaSixbD/100-tips-for-a-better-life

import random, terminal, std/wordwrap

type
  Tip = object
    section: string
    number: int
    content: string

# The other day I made an advice thread based on Jacobian’s from last year! If
# you know a source for one of these, shout and I’ll edit it in.

let tips = [
  # Possessions
  Tip(number: 1, section: "Possessions",
      content: "If you want to find out about people’s opinions on a product, google <product> reddit. You’ll get real people arguing, as compared to the SEO’d Google results."),
  Tip(number: 2, section: "Possessions",
      content: "Some banks charge you $20 a month for an account, others charge you 0. If you’re with one of the former, have a good explanation for what those $20 are buying."),
  Tip(number: 3, section: "Possessions",
      content: "Things you use for a significant fraction of your life (bed: 1/3rd, office-chair: 1/4th) are worth investing in. "),
  Tip(number: 4, section: "Possessions",
      content: "“Where is the good knife?” If you’re looking for your good X, you have bad Xs. Throw those out. "),
  Tip(number: 5, section: "Possessions",
      content: "If your work is done on a computer, get a second monitor. Less time navigating between windows means more time for thinking. "),
  Tip(number: 6, section: "Possessions",
      content: "Establish clear rules about when to throw out old junk. Once clear rules are established, junk will probably cease to be a problem. This is because any rule would be superior to our implicit rules (“keep this broken stereo for five years in case I learn how to fix it”). "),
  Tip(number: 7, section: "Possessions",
      content: "Don’t buy CDs for people. They have Spotify. Buy them merch from a band they like instead. It’s more personal and the band gets more money. "),
  Tip(number: 8, section: "Possessions",
      content: "When buying things, time and money trade-off against each other. If you’re low on money, take more time to find deals. If you’re low on time, stop looking for great deals and just buy things quickly online. "),

  # Cooking
  Tip(number: 9, section: "Cooking", content: "Steeping minutes: Green at 3, black at 4, herbal at 5. Good tea is that simple! "),
  Tip(number: 10, section: "Cooking", content: "Food actually can be both cheap, healthy, tasty, and relatively quick to prepare. All it requires is a few hours one day to prepare many meals for the week. "),
  Tip(number: 11, section: "Cooking", content: "Cooking pollutes the air. Opening windows for a few minutes after cooking can dramatically improve air quality. "),
  Tip(number: 12, section: "Cooking", content: "Food taste can be made much more exciting through simple seasoning. It’s also an opportunity for expression. Buy a few herbs and spices and experiment away."),
  Tip(number: 13, section: "Cooking", content: "When googling a recipe, precede it with ‘best’. You’ll find better recipes. "),

  # Productivity
  Tip(number: 14, section: "Productivity",
      content: "Advanced search features are a fast way to create tighter search statements. For example:\n\nimg html\n\nwill return inferior results compared to:\n\nimg html -w3"),
  Tip(number: 15, section: "Productivity",
      content: "You can automate mundane computer tasks with Autohotkey (or AppleScript). If you keep doing a sequence “so simple a computer can do it”, make the computer do it. "),
  Tip(number: 16, section: "Productivity",
      content: "Learn keyboard shortcuts. They’re easy to learn and you’ll get tasks done faster and easier. "),
  Tip(number: 17, section: "Productivity",
      content: "Done is better than perfect. "),
  Tip(number: 18, section: "Productivity",
      content: "Keep your desk and workspace bare. Treat every object as an imposition upon your attention, because it is. A workspace is not a place for storing things. It is a place for accomplishing things. "),
  Tip(number: 19, section: "Productivity",
      content: "Reward yourself after completing challenges, even badly. "),

  # Body
  Tip(number: 20, section: "Body", content: "The 20-20-20 rule: Every 20 minutes of screenwork, look at a spot 20 feet away for 20 seconds. This will reduce eye strain and is easy to remember (or program reminders for). "),
  Tip(number: 21, section: "Body", content: "Exercise (weightlifting) not only creates muscle mass, it also improves skeletal structure. Lift!"),
  Tip(number: 22, section: "Body", content: "Exercise is the most important lifestyle intervention you can do. Even the bare minimum (15 minutes a week) has a huge impact. Start small. "),
  Tip(number: 23, section: "Body", content: "(~This is not medical advice~). Don’t waste money on multivitamins, they don’t work. Vitamin D supplementation does seem to work, which is important because deficiency is common. "),
  Tip(number: 24, section: "Body", content: "Phones have gotten heavier in the last decade and they’re actually pretty hard on your wrists! Use a computer when it’s an alternative or try to at least prop up your phone. "),

  # Success
  Tip(number: 25, section: "Success", content: "History remembers those who got to market first. Getting your creation out into the world is more important than getting it perfect."),
  Tip(number: 26, section: "Success", content: "Are you on the fence about breaking up or leaving your job? You should probably go ahead and do it. People, on average, end up happier when they take the plunge. "),
  Tip(number: 27, section: "Success", content: "Discipline is superior to motivation. The former can be trained, the latter is fleeting. You won’t be able to accomplish great things if you’re only relying on motivation. "),
  Tip(number: 28, section: "Success", content: "You can improve your communication skills with practice much more effectively than you can improve your intelligence with practice. If you’re not that smart but can communicate ideas clearly, you have a great advantage over everybody who can’t communicate clearly."),
  Tip(number: 29, section: "Success", content: "You do not live in a video game. There are no pop-up warnings if you’re about to do something foolish, or if you’ve been going in the wrong direction for too long. You have to create your own warnings. "),
  Tip(number: 30, section: "Success", content: "If you listen to successful people talk about their methods, remember that all the people who used the same methods and failed did not make videos about it. "),
  Tip(number: 31, section: "Success", content: "The best advice is personal and comes from somebody who knows you well. Take broad-spectrum advice like this as needed, but the best way to get help is to ask honest friends who love you."),
  Tip(number: 32, section: "Success", content: "Make accomplishing things as easy as possible. Find the easiest way to start exercising. Find the easiest way to start writing. People make things harder than they have to be and get frustrated when they can’t succeed. Try not to. "),
  Tip(number: 33, section: "Success", content: "Cultivate a reputation for being dependable. Good reputations are valuable because they’re rare (easily destroyed and hard to rebuild). You don’t have to brew the most amazing coffee if your customers know the coffee will always be hot."),
  Tip(number: 34, section: "Success", content: "How you spend every day is how you spend your life. "),

  # Rationality
  Tip(number: 35, section: "Rationality",
      content: "Noticing biases in others is easy, noticing biases in yourself is hard. However, it has much higher pay-off."),
  Tip(number: 36, section: "Rationality",
      content: "Explaining problems is good. Often in the process of laying out a problem, a solution will present itself."),
  Tip(number: 37, section: "Rationality",
      content: "Foolish people are right about most things. Endeavour to not let the opinions of foolish people automatically discredit those opinions."),
  Tip(number: 38, section: "Rationality",
      content: "You have a plan. A time-traveller from 2030 appears and tells you your plan failed. Which part of your plan do you think is the one that fails? Fix that part."),
  Tip(number: 39, section: "Rationality",
      content: "If something surprises you again and again, stop being surprised."),
  Tip(number: 40, section: "Rationality",
      content: "Should you freak out upon seeing your symptoms on the worst diseases on WebMD? Probably not! Look up the base rates for the disease and then apply Bayes’ Theorem"),
  Tip(number: 41, section: "Rationality",
      content: "Selfish people should listen to advice to be more selfless, selfless people should listen to advice to be more selfish. This applies to many things. Whenever you receive advice, consider its opposite as well. You might be filtering out the advice you need most."),
  Tip(number: 42, section: "Rationality",
      content: "Common systems and tools have been designed so everybody can handle them. So don’t worry that you’re the only one who can’t! You can figure out doing laundry, baking, and driving on a highway."),

  # Self
  Tip(number: 43, section: "Self", content: "Deficiencies do not make you special. The older you get, the more your inability to cook will be a red flag for people."),
  Tip(number: 44, section: "Self", content: "There is no interpersonal situation that can’t be improved by knowing more about your desires, goals, and structure. ‘Know thyself!’"),
  Tip(number: 45, section: "Self", content: "If you’re under 90, try things."),
  Tip(number: 46, section: "Self", content: "Things that aren’t your fault can still be your responsibility."),
  Tip(number: 47, section: "Self", content: "Defining yourself by your suffering is an effective way to keep suffering forever (ex. incels, trauma)."),
  Tip(number: 48, section: "Self", content: "Keep your identity small. “I’m not the kind of person who does things like that” is not an explanation, it’s a trap. It prevents nerds from working out and men from dancing."),
  Tip(number: 49, section: "Self", content: "Don’t confuse ‘doing a thing because I like it’ with ‘doing a thing because I want to be seen as the sort of person who does such things’"),
  Tip(number: 50, section: "Self", content: "Remember that you are dying."),
  Tip(number: 51, section: "Self", content: "Events can hurt us, not just our perceptions of them. It’s good to build resilience, but sometimes it isn’t your fault if something really gets to you."),
  Tip(number: 52, section: "Self", content: "If you want to become funny, try just saying stupid shit (in the right company!) until something sticks."),
  Tip(number: 53, section: "Self", content: "To start defining your problems, say (out loud) “everything in my life is completely fine.” Notice what objections arise."),
  Tip(number: 54, section: "Self", content: "Procrastination comes naturally, so apply it to bad things. “I want to hurt myself right now. I’ll do it in an hour.” “I want a smoke now, so in half an hour I’ll go have a smoke.” Then repeat. Much like our good plans fall apart while we delay them, so can our bad plans."),
  Tip(number: 55, section: "Self", content: "Personal epiphanies feel great, but they fade within weeks. Upon having an epiphany, make a plan and start actually changing behavior."),
  Tip(number: 56, section: "Self", content: "Sometimes unsolvable questions like “what is my purpose?” and “why should I exist?” lose their force upon lifestyle fixes. In other words, seeing friends regularly and getting enough sleep can go a long way to solving existentialism."),

  # Hazards
  Tip(number: 57, section: "Hazards", content: "There are two red flags to avoid almost all dangerous people: 1. The perpetually aggrieved ; 2. The angry."),
  Tip(number: 58, section: "Hazards", content: "Some people create drama out of habit. You can avoid these people."),
  Tip(number: 59, section: "Hazards", content: "Those who generate anxiety in you and promise that they have the solution are grifters. See: politicians, marketers, new masculinity gurus, etc. Avoid these."),
  Tip(number: 60, section: "Hazards", content: "(~This is not legal advice!~) DO NOT TALK TO COPS."),
  Tip(number: 61, section: "Hazards", content: "It is cheap for people to talk about their values, goals, rules, and lifestyle. When people’s actions contradict their talk, pay attention!"),
  Tip(number: 62, section: "Hazards", content: "“If they’ll do it with you, they’ll do it to you” and “those who live by the sword die by the sword” mean the same thing. Viciousness you excuse in yourself, friends, or teammates will one day return to you, and then you won’t have an excuse."),

  # Others
  Tip(number: 63, section: "Others", content: "In choosing between living with 0-1 people vs 2 or more people, remember that ascertaining responsibility will no longer be instantaneous with more than one roommate (“whose dishes are these?”)."),
  Tip(number: 64, section: "Others", content: "Understand people have the right to be tasteless."),
  Tip(number: 65, section: "Others", content: "You will prevent yourself from even having thoughts that could lower your status. Avoid blocking yourself off just so people keep thinking you’re cool."),
  Tip(number: 66, section: "Others", content: "Being in groups is important. If you don’t want to join a sports team, consider starting a shitty band. It’s the closest you’ll get to being in an RPG. Train with 2-4 other characters, learn new moves, travel from pub to pub, and get quests from NPCs."),
  Tip(number: 67, section: "Others", content: "It’s possible to get people to do things that make you like them more but respect them less. Avoid this, it destroys relationships."),
  Tip(number: 68, section: "Others", content: "Think a little about why you enjoy what you enjoy. If you can explain what you love about Dune, you can now communicate not only with Dune fans, but with people who love those aspects in other books."),
  Tip(number: 69, section: "Others", content: "When you ask people, “What’s your favorite book / movie / band?” and they stumble, ask them instead what book / movie / band they’re currently enjoying most. They’ll almost always have one and be able to talk about it."),
  Tip(number: 70, section: "Others", content: "Bored people are boring."),
  Tip(number: 71, section: "Others", content: "A norm of eating with your family without watching something will lead to better conversations. If this idea fills you with dread, consider getting a new family."),
  Tip(number: 72, section: "Others", content: "If you bus to other cities, consider finding a rideshare on Facebook instead. It’s cheaper, faster, and leads to interesting conversations."),

  # Relationships
  Tip(number: 73, section: "Relationships",
      content: "In relationships look for somebody you can enjoy just hanging out near. Long-term relationships are mostly spent just chilling."),
  Tip(number: 74, section: "Relationships",
      content: "Sometimes things last a long time because they’re good (jambalaya). But that doesn’t mean that because something has lasted a long time that it is good (penile subincisions). Apply this to relationships, careers, and beliefs as appropriate."),
  Tip(number: 75, section: "Relationships",
      content: "Don’t complain about your partner to coworkers or online. The benefits are negligible and the cost is destroying a bit of your soul."),
  Tip(number: 76, section: "Relationships",
      content: "After a breakup, cease all contact as soon as practical. The potential for drama is endless, and the potential for a good friendship is negligible."),
  Tip(number: 77, section: "Relationships",
      content: "If you haven’t figured things out sexually, remember that there isn’t a deadline. If somebody is making you feel like there is, consider the possibility that they aren’t your pal."),
  Tip(number: 78, section: "Relationships",
      content: "If you have trouble talking during dates, try saying whatever comes into your head. At worst you’ll ruin some dates (which weren’t going well anyways), at best you’ll have some great conversations. Alcohol can help."),
  Tip(number: 79, section: "Relationships",
      content: "When dating, de-emphasizing your quirks will lead to 90% of people thinking you’re kind of alright. Emphasizing your quirks will lead to 10% of people thinking you’re fascinating and fun. Those are the people interested in dating you. Aim for them."),
  Tip(number: 80, section: "Relationships",
      content: "Relationships need novelty. It’s hard to have novelty during Covid--but have you planned your post-Covid adventure yet?"),
  Tip(number: 81, section: "Relationships",
      content: "People can be the wrong fit for you without being bad. Being a person is complicated and hard."),

  # Compassion
  Tip(number: 82, section: "Compassion",
      content: "Call your parents when you think of them, tell your friends when you love them."),
  Tip(number: 83, section: "Compassion",
      content: "Compliment people more. Many people have trouble thinking of themselves as smart, or pretty, or kind, unless told by someone else. You can help them out."),
  Tip(number: 84, section: "Compassion",
      content: "If somebody is undergoing group criticism, the tribal part in you will want to join in the fun of righteously destroying somebody. Resist this, you’ll only add ugliness to the world. And anyway, they’ve already learned the lesson they’re going to learn and it probably isn’t the lesson you want."),
  Tip(number: 85, section: "Compassion",
      content: "Cultivate compassion for those less intelligent than you. Many people, through no fault of their own, can’t handle forms, scammers, or complex situations. Be kind to them because the world is not."),
  Tip(number: 86, section: "Compassion",
      content: "Cultivate patience for difficult people. Communication is extremely complicated and involves getting both tone and complex ideas across. Many people can barely do either. Don’t punish them."),
  Tip(number: 87, section: "Compassion",
      content: "Don’t punish people for trying. You teach them to not try with you. Punishing includes whining that it took them so long, that they did it badly, or that others have done it better."),
  Tip(number: 88, section: "Compassion",
      content: "Remember that many people suffer invisibly, and some of the worst suffering is shame. Not everybody can make their pain legible."),
  Tip(number: 89, section: "Compassion",
      content: "Don't punish people for admitting they were wrong, you make it harder for them to improve."),
  Tip(number: 90, section: "Compassion",
      content: "In general, you will look for excuses to not be kind to people. Resist these."),

  # Joy
  Tip(number: 91, section: "Joy", content: "Human mood and well-being are heavily influenced by simple things: Exercise, good sleep, light, being in nature. It’s cheap to experiment with these."),
  Tip(number: 92, section: "Joy", content: "You have vanishingly little political influence and every thought you spend on politics will probably come to nothing. Consider building things instead, or at least going for a walk."),
  Tip(number: 93, section: "Joy", content: "Sturgeon’s law states that 90% of everything is crap. If you dislike poetry, or fine art, or anything, it’s possible you’ve only ever seen the crap. Go looking!"),
  Tip(number: 94, section: "Joy", content: "You don’t have to love your job. Jobs can be many things, but they’re also a way to make money. Many people live fine lives in okay jobs by using the money they make on things they care about."),
  Tip(number: 95, section: "Joy", content: "Some types of sophistication won’t make you enjoy the object more, they’ll make you enjoy it less. For example, wine snobs don’t enjoy wine twice as much as you, they’re more keenly aware of how most wine isn’t good enough. Avoid sophistication that diminishes your enjoyment."),
  Tip(number: 96, section: "Joy", content: "If other people having it worse than you means you can’t be sad, then other people having it better than you would mean you can’t be happy. Feel what you feel."),
  Tip(number: 97, section: "Joy", content: "Liking and wanting things are different. There are things like junk food that you want beyond enjoyment. But you can also like things (like reading) without wanting them. If you remember enjoying something but don't feel a desire for it now, try pushing yourself."),
  Tip(number: 98, section: "Joy", content: "People don’t realize how much they hate commuting. A nice house farther from work is not worth the fraction of your life you are giving to boredom and fatigue."),
  Tip(number: 99, section: "Joy", content: "There’s some evidence that introverts and extroverts both benefit from being pushed to be more extroverted. Consider this the next time you aren’t sure if you feel like going out."),
  Tip(number: 100, section: "Joy", content: "Bad things happen dramatically (a pandemic). Good things happen gradually (malaria deaths dropping annually) and don’t feel like ‘news’. Endeavour to keep track of the good things to avoid an inaccurate and dismal view of the world."),
]

proc lifeTip() =
  let run = rand(len(tips)-1)
  let tip = tips[run]
  echo ""
  stdout.styledWriteLine(styleBright, tip.section)
  echo wrapWords(tip.content, 79)
  echo ""

# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

when isMainModule:
  randomize()
  lifeTip()
