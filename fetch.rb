require 'net/http'
require 'uri'

idx = 1
while(true)
    uri = URI.parse("https://onepiece.fandom.com/wiki/Episode_#{idx}")
    response = Net::HTTP.get_response uri

    text = response.body

    # parsing html with regex because FUCK YOU
    start = text.index('<span class="mw-headline" id="Long_Summary">Long Summary</span></h2>')
    text=text[start..text.length]
    endof = text.index("<h2>")
    text= text[0...endof]

    # delete html
    text.gsub!(/\<.*?\>/, '')

    # clean up /ns
    text.gsub!("\n"," ")
    # clean up Long Summary
    text.gsub!("Long Summary","START ")

    text += " END"

    p text


    File.write("eps/#{idx}.txt",text)

    idx += 1
end