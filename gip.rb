class Gip < Formula
  desc "マーカーコメント処理プロセッサ"
  homepage "https://github.com/gumi278/git-intent-picker"
  url "https://github.com/gumi278/git-intent-picker/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "d2cc3f115fcfda3655ac945778fa79dca2a01a4de37a77a58df7ddd6aadae1d8"
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
