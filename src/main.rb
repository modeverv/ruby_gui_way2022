require 'glimmer-dsl-libui'

include Glimmer

def x(input)
  input + "111111"
end

window('hello world', 300, 50) {
  horizontal_box {
    @entry = entry {
      on_changed do
        puts @entry.text
        $stdout.flush # リアルタイムにターミナルに表示
      end
    }
    
    button('Button') {
      stretchy false
      
      on_clicked do
        text = @entry.text
        msg_box(text, "で処理を開始します10秒ぐらい程度所要します")
        sleep(10)
        result = x(text)
        msg_box("処理結果:", result)
      end
    }
  }
}.show
