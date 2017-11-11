@nouns = [
  "rain", "apparatus", "butter", "toothpaste", "ticondaroga",
  "view", "kale", "island", "ice", "typhoon",
  "outside", "ocean", "kitty", "volcano", "enemy"
]

@verbs = [
  "bruise", "kill", "paint", "walk", "spelunking",
  "run", "continue", "disappear", "dance", "reject",
  "wiggle", "explode", "exercise", "fall", "marry"
]

@random_answers = [
  "You will #{@verbs.sample} a #{@nouns.sample}!",
  "I see #{@nouns.sample} in your future!",
  "Don't #{@verbs.sample} on Mondays or Tuesdays!",
  "It is likely, the #{@nouns.sample} will #{@verbs.sample}"
]

@noun_backup = @nouns.clone
@verb_backup = @verbs.clone
