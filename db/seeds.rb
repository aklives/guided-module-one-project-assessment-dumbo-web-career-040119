Author.destroy_all
Band.destroy_all
Post.destroy_all

max = Author.create(name: "Maxwell Benton")
jon = Author.create(name: "Jonathan Archer")
sam = Author.create(name: "Sam Jensen")

beatles = Band.create(name: "The Beatles")
zombies = Band.create(name: "The Zombies")
monkeys = Band.create(name: "The Monkeys")

post1 = Post.create(title: "The Beatles Rule", author_id: max.id, band_id: beatles.id, post: "I've always loved the Beatles")
post2 = Post.create(title: "The Zombies Rule", author_id: jon.id, band_id: zombies.id, post: "I've always loved the Zombies")
post3 = Post.create(title: "The Monkeys Rule", author_id: sam.id, band_id: monkeys.id, post: "I've always loved the Monkeys")
