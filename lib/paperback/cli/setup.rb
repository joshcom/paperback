require "rubygems"
require 'pp'
require 'irb/ext/save-history'
require 'paperback'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.paperback-history"


IRB.conf[:AUTO_INDENT]=true
IRB.conf[:PROMPT][:PAPERBACK]= {
  :PROMPT_I => "Paperback:%03n:%i> ",
  :PROMPT_S => "Paperback:%03n:%i%l ",
  :PROMPT_C => "Paperback:%03n:%i* ",
  :RETURN => "%s\n"
} 

IRB.conf[:PROMPT_MODE] = :PAPERBACK
