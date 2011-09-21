#!/bin/env ruby

uniq_commands = []

while true
  commands = `ps axwww`
  commands.each_line do |command|
    cmds = command.chomp.split(/\s+/)
    if cmds[0] == ""
      cmds.delete_at(0)
    end
    cmd = cmds[4..-1].join(" ")
    # if cmd =~ /^-/
    #   puts "=================="
    #   puts command
    #   puts "=================="
    #   command.chomp.split(/\s+/).each do |chunk|
    #     puts "==> " + chunk
    #   end
    #   puts "=================="
    # end
    
    if cmd =~ /^\d/
      puts "=================="
      puts command
      puts "=================="
      puts cmds[0].bytes.to_a
      puts "=================="
      command.chomp.split(/\s+/).each do |chunk|
        puts "==> " + chunk
      end
      puts "=================="
    end
    unless uniq_commands.find_index(cmd) 
      uniq_commands << cmd
      puts cmd
    end
  end
end