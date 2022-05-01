require 'libui'

# メソッドは前に書いておかないとけない。
# rubyの基本だった気もするがこのライブラリ特有の気もする
def x(input)
  return input + "111111"
end

UI = LibUI

UI.init

# ウィンドウを作成
main_window = UI.new_window('hello world', 300, 50, 1)
# ×ボタンでウィンドウを消せるようにする
UI.window_on_closing(main_window) do
  puts 'Bye Bye'
  UI.control_destroy(main_window)
  UI.quit
  0
end

# 配置用のボックス
hbox = UI.new_horizontal_box
# ボックスをウィンドウに追加
UI.window_set_child(main_window, hbox)

# 入力欄の作成
entry = UI.new_entry
# 文字が入力されたターミナルに表示
UI.entry_on_changed(entry) do
  puts UI.entry_text(entry).to_s
  $stdout.flush # リアルタイムにターミナルに表示
end
# ボックスに追加
UI.box_append(hbox, entry, 1)

# ボタン
button = UI.new_button('Button')
# ボックスに追加
UI.box_append(hbox, button, 0)
# ボタンが押されたら、ダイアログを出して処理中にする
#
UI.button_on_clicked(button) do
end
UI.button_on_clicked(button) do
  text = UI.entry_text(entry).to_s
  UI.msg_box(main_window, text, "で処理を開始します10秒ぐらい程度所要します")
  sleep(10)
  result = x(text)
  UI.msg_box(main_window, "処理結果:", result)
  0
end



# ウインドウを表示
UI.control_show(main_window)
UI.main
UI.quit


