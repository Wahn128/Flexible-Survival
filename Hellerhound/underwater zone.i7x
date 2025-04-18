Version 2 of Underwater Zone by Hellerhound begins here.
[Version 2.1 - Adjusted for new Beach layout]

Section 1 - Gill Fruit Tree

Table of GameEventIDs (continued)
Object	Name
Gill Fruits Tree	"Gill Fruits Tree"

Gill Fruits Tree is a situation.
ResolveFunction of Gill Fruits Tree is "[ResolveEvent Gill Fruits Tree]".
Sarea of Gill Fruits Tree is "Beach".

to say ResolveEvent Gill Fruits Tree:
	say "You come across an odd tree, half in and half out of the water, with slitted fruits on the branches. This must be the elusive gill fruit tree.";
	say "Do you wish to pick some?";
	if Player consents:
		ItemGain gill fruit by 1 silently;
		say "As you pick some of the fruit, the rest falls off into the water, overripe. Odd.";
		now Resolution of Gill Fruits Tree is 1; [got a fruit]
		now gill fruits tree is resolved;
	else:
		say "You leave the tree alone.";

gill fruit is a grab object.
gill fruit has a Usedesc "[gill fruit use]".
hasgills is a number that varies.

Table of Game Objects (continued)
name	desc	weight	object
"Gill Fruit"	"An oddly slitted fruit, green-blue and ripe to eat."	1	gill fruit

to say gill fruit use:
	say "You eagerly gulp the fruit.";
	now hasgills is 1;
	PlayerDrink 10;
	PlayerEat 10;
	increase score by 10;
	say "You feel a tingling in your neck, and somehow understand that if you were to go underwater you could breathe.";
	follow the turnpass rule;

the scent of gill fruit is "The strange fruit has a faint, fishy scent.".

Section 2 - Underwater Beach

instead of going down from Open Ocean:
	if hasgills is 1:
		say "     You dive into the water, making your way to the sunken ship, feeling the gills appear on your neck to allow you to breath. It doesn't take you that long to get their thankfully so you quite quickly arrive at the ship.";
		move player to Sunken Ship;
	else if FaceName of Player is listed in infections of SwimList:
		say "     With your natural ability to breathe underwater due to your infection, you dart under and swim towards the sunken ship. Thankfully for your patience it doesn't take you long to reach the ship.";
		move player to Sunken Ship;
	else:
		say "     You shake your head furiously as you realize that you'd probably drown without any ability to breathe underwater. Perhaps you should find a way to do so before you start diving into deep waters.";

Section 3 - Sea Dragon Cum

Table of Game Objects (continued)
name	desc	weight	object
"sea dragon cum"	"Thick seed from one of the dangerous sea dragons that marauds the coast. It is rarely found concentrated like this."	1	sea dragon cum

the scent of sea dragon cum is "The cum smells powerfully of a male sea dragon.".

to say sea dragon cum use:
	if Player is female:
		say "Do you wish to eat the seed (y), or impregnate yourself with it (n)?";
		if Player consents:
			if a random chance of one in two succeeds and MaleList is not banned:
				infect "Feral Sea Dragon";
			else:
				infect "Feral Sea Dragoness";
		else:
			say "You rub the thick stuff into your waiting cunt, massaging it in. You moan in pleasure as you work the thick cum deep inside you.";
			if a random chance of one in two succeeds and MaleList is not banned:
				infect "Feral Sea Dragon";
			else:
				infect "Feral Sea Dragoness";
			impregnate with "Feral Sea Dragon[one of][or]ess[at random]";
	else:
		if a random chance of one in two succeeds and MaleList is not banned:
			infect "Feral Sea Dragon";
		else:
			infect "Feral Sea Dragoness";

sea dragon cum is a grab object. sea dragon cum is cum.
sea dragon cum has a Usedesc "[sea dragon cum use]".

Section 4 - Fighting

to swimmingfight:
	let T be a random number between one and 10;
	if T is 1:
		if FurryList is banned or MaleList is banned:
			increase T by 1;
		else:
			say "As you [if rowing is true]row[else]swim[end if], you spot a sleek and streamlined blue form cutting through the water. As the draconic serpent draws closer, you [if rowing is true]row[else]swim[end if] as quickly as you can to a nearly rocky outcropping and prepare to face the fearsome beast.";
			challenge "Feral Sea Dragon"; [duh case, all three ways]
	if T is 2:
		if FurryList is banned or FemaleList is banned:
			increase T by 1;
		else:
			say "As you [if rowing is true]row[else]swim[end if], you spot a sleek and streamlined blue form cutting through the water. As the draconic serpent draws closer, you [if rowing is true]row[else]swim[end if] as quickly as you can to a nearly rocky outcropping and prepare to face the fearsome beast.";
			challenge "Feral Sea Dragoness";
	if T is 3:
		if FurryList is banned or HermList is banned:
			increase T by 1;
		else:
			challenge "Dolphin Herm";
	if T is 4:
		if FurryList is banned or MaleList is banned:
			increase T by 1;
		else:
			challenge "Killer Whale";
	if T is 5:
		if FurryList is banned:
			increase T by 1;
		else:
			challenge "Sea Otter";
	if T is 6:
		if MaleList is banned:
			increase T by 1;
		else:
			challenge "Siren";

Underwater Zone ends here.
