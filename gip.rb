class Gip < Formula
  desc "git intent picker"
  homepage "https://github.com/gumi278/git-intent-picker"
  url "https://github.com/gumi278/git-intent-picker/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "924916c28f59aee7fe35483b08f9215202c34e6df000dde83ce3ee2d65cd917b"
  license "MIT"

  # 依存関係: ghコマンドがない場合は自動でインストールしてくれます
  depends_on "gh"
  depends_on "python3"

  def install
    # src/gip/main.py を 'gip' という名前の実行コマンドとしてインストール
    bin.install "src/gip/main.py" => "gip"
  end

  test do
    system "#{bin}/gip", "--help"
  end
end
