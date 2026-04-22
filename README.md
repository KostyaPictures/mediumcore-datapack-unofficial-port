# Origin

Original mod - [AlexModGuy: Mediumcore](https://github.com/AlexModGuy/Mediumcore)

# What does this datapack do?

As AlexModGuy wrote,
> Mediumcore is a new difficulty option that is designed to be more difficult than regular survival, but far less punishing than vanilla's Hardcore Mode. The only significant change mediumcore has over default survival is that each death decreases the maximum available health a player can regenerate. The player looses a heart of max health per death, until they only have 3 hearts of health left. At this point, they will not loose anymore and can continue to play the game in their hobbled, feeble state. Luckily, this punishment isn't permanent - if you're willing to do what it takes to get your hearts back. Consuming a Golden Apple or Enchanted Golden Apple will grant you one of your missing hearts, along with the usual effects of consuming these foods.
<img width="752" height="183" alt="image" src="https://github.com/user-attachments/assets/0d0c7840-9bef-4a00-9031-3c01fbb072b7" />
↑ ↑ ↑ ↑ </br>
if the player died 3 times </br> </br>

This is my first datapack coded with minecraft variables. </br>
It was a hard journey and in the end almost all functions from original mod are working

# How to configure it?

the main config file is located in `\data\mediumcore\function\config.mcfunction`</br>
(in `\data\mediumcore\functions\config.mcfunction` for 1.20.2)
<img width="1126" height="448" alt="image" src="https://github.com/user-attachments/assets/e601e13f-5f74-4bb3-8981-085963f5ac8f" /></br>
Here's what each value does
| in config | what it means |
|----------|----|
| items:\["enchanted_golden_apple",...\] | items, that when consumed will regenerate your health |
| max:10 | maximum player hearts |
| max_1:11 | maximum player hearts+1 (please do not set it with wrong values, that are not "max"+1) |
| max_deaths:7 | maximum player deaths (when you die a lot you will end up with (max)-(max_deaths) hearts. By default your minimum hearts is 3) |

# Will make this, if the project will get some attention

### I will make this datapack more configurable
In original mod you can change, how many health an item will regenerete you, how many hearts will disappear after death and so on

### I will make a better 1.20.2 version
in 1.20.2 - `function` is `functions` and `minecraft:max_health` is `minecraft:generic.max_health` and also something just doest work, so I did a temporarly solution: I put `load.mcfunction` inside `tick.mcfuction`</br>
If this project gets attention I'll try to find an error and make a better solution

### I will TRY to make support for 1.20.1 and lower
Mojang added "$" macros in mcfunction only in 1.20.2, and my datapack uses it a lot</br>
Will stretch this datapack to 1.20.1 if only project gets a lot of attention
