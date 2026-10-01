class Gip < Formula
  desc "AI駆動開発のための意図のサイドカー (Marker comment extractor)"
  homepage "https://github.com/gumi278/git-intent-picker"
  url "https://github.com/gumi278/git-intent-picker/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "839eae636ea0c65b17039b9afb256ede9c74cc0b70949c9a96cb3df361e9c784"
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
