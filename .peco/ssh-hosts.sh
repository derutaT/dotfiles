# ssh with peco
# ref: http://qiita.com/d6rkaiz/items/46e9c61c412c89e84c38
function ssh-hosts() {
  # Host で * や ? を使用しているものは除外
  #  BUFFER="ssh $(grep '^Host ' ~/.ssh/config | grep -v '[*?]' | cut -c 6- | sort | peco | cut -d ' ' -f 1)"

  # Hostの次の行にあるコメントをホスト名と一緒に表示するためのrubyワンライナー
  #
  # Host hostname
  #   # COMMENT
  #   HostName 1.2.3.4
  #
  # 上記の形式をパースして "hostname  # COMMENT" に変換します
  # BUFFER="ssh $(ruby -e "File.read('/home/hara_masaki/.ssh/config').scan(/#\s+Host |Host ([^*?\s]+)\n\s+(# [^\n]+)\n|Host ([^*?\s]+)\n/).each do |info|; unless info.first.nil?; puts \"#{info[0]}\t#{info[1]}\"; else; puts info.last; end; end" | sort | peco | cut -f 1)"
  BUFFER="ssh $(ruby -e "File.read('$HOME/.ssh/config').scan(/#[ \t]+Host|Host ([^*?\s]+)\n\s+(# [^\n]+)\n|Host ([^*?\s]+)\n/).each do |info| unless info.first.nil?; puts \"#{info[0]}\t#{info[1]}\"; else; puts info.last; end; end" | sort | peco | cut -f 1)"
  CURSOR=4
  zle clear-screen
}
zle -N ssh-hosts
bindkey '^s^s' ssh-hosts

