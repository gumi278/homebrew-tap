class Gip < Formula
  desc "マーカーコメント処理プロセッサ"
  homepage "https://github.com/gumi278/git-intent-picker"
  url "https://github.com/gumi278/git-intent-picker/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "561e26bd0662ab5843de64931deb40bd9e80d677b318cdc082c0b66332008e96"
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
