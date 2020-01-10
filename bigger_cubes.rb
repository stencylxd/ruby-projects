
=begin

This is a small game that I used to test my skills.
It is one line.
---------------------------------------------------
bigger_cubes.rb | stencylxd 2019
585x 435y default screen size

=end

require "ruby2d"; set title: "Bigger Cubes", background: "navy"; apple_eaten = false; dead = false; restart = false; title = true; key_pressed = ""; choice = nil; score = 0; randx = rand(565); randy = rand(415); @player = Square.new(color: "olive", size: 30, x: randx, y: randy); randx = rand(565); randy = rand(415); @player.z = 10; randx = @player.x; randy = @player.y; until randx != @player.x && randy != @player.y; randx = rand(20..565); randy = rand(20..415); end; @apple = Square.new(color: "red", size: 15, x: randx, y: randy); on :key_held do |event|; if dead == false; @player.y -= 3 if event.key == "w" || event.key == "W"; @player.x -= 3 if event.key == "a" || event.key == "A"; @player.y += 3 if event.key == "s" || event.key == "S"; @player.x += 3 if event.key == "d" || event.key == "D"; end; key_pressed = event.key; key_pressed = key_pressed.downcase; if dead == true; restart = true if key_pressed == "y"; abort if key_pressed == "n"; elsif title == true; if key_pressed == "y"; title = false; restart = true; elsif key_pressed == "n"; abort; end; end; apple_eaten = true if @player.contains?(@apple.x, @apple.y); if apple_eaten == true; score += 1; @player.size += 3; randx = @player.x; randy = @player.y; until randx != @player.x && randy != @player.y; randx = rand(20..565); randy = rand(20..415); end; @apple.x = randx; @apple.y = randy; apple_eaten = false; end; end; update do; clear; @player.add; @apple.add; if title == true; clear; Text.new("Bigger Cubes | by stencylxd (Leo Markley)", font: "mono.ttf"); Text.new("Every time you eat a apple, you grow 3 pixels.", y: 40, font: "mono.ttf"); Text.new("Hit the sides of the window, game over.", y: 60, font: "mono.ttf"); Text.new("Start the Game? (y/n)...", y: 100, font: "mono.ttf"); if key_pressed == "y"; restart = true; title = false; elsif key_pressed == "n"; abort; end; else; Text.new("Score: " + score.to_s.chomp, z: 20, font: "mono.ttf"); Text.new("Size: " + @player.size.to_s.chomp, z: 20, font: "mono.ttf", y: 20); @player.y -= 2 if key_pressed == "w"; @player.x -= 2 if key_pressed == "a"; @player.y += 2 if key_pressed == "s"; @player.x += 2 if key_pressed == "d"; apple_eaten = true if @player.contains?(@apple.x, @apple.y); dead = true if @player.x < 1 || @player.x > 585 || @player.y < 1 || @player.y > 435; if apple_eaten == true; score += 1; @player.size += 3; randx = @player.x; randy = @player.y; until randx != @player.x && randy != @player.y; randx = rand(20..565); randy = rand(20..415); end; @apple.x = randx; @apple.y = randy; apple_eaten = false; end; if dead == true; clear; key_pressed = ""; Text.new("Game Over!", font: "mono.ttf"); Text.new("Score: " + score.to_s.chomp, font: "mono.ttf", y: 40); Text.new("Size: " + @player.size.to_s.chomp + " pixels", font: "mono.ttf", y: 60); Text.new("Retry? (y/n)...", font: "mono.ttf", y: 100); restart = true if key_pressed == "y"; abort if key_pressed == "n"; end; if restart == true; clear; @apple.add; @player.add; 100.times { puts nil }; apple_eaten = false; dead = false; restart = false; title = false; score = 0; key_pressed = ""; choice = ""; randx = rand(20..565); randy = rand(20..415); @player.x = randx; @player.y = randy; until randx != @player.x && randy != @player.y && randx > 20 && randy > 20 && randx < 565 && randy < 415; randx = rand(20..565); randy = rand(20..415); end; @apple.x = randx; @apple.y = randy; @player.size = 30; end; end; end; show
