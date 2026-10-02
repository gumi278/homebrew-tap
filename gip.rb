class Gip < Formula
  desc "マーカーコメント処理プロセッサ"
  homepage "https://github.com/gumi278/git-intent-picker"
  url "https://github.com/gumi278/git-intent-picker/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "37b798f75190cc25bdc1c4e423a7f8b373c2a246dcf41965ba798a04128be3af"
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
