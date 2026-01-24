class IgnoreSh < Formula
  desc "Manage your .gitignore file (Shell version)"
  homepage "https://github.com/acevif/ignore"
  url "https://github.com/acevif/ignore/archive/refs/tags/0.3.2.tar.gz"
  sha256 "422002a68cb1daa23caa825332d94ed425c5b18b20e27c6e1ecd10286d6919ab"
  license "Unlicense"

  depends_on "yq"

  conflicts_with "ignore", because: "both provide 'ignore' command"
  conflicts_with "ignore-rs", because: "both provide 'ignore' command"

  def install
    bin.install "ignore"
  end

  test do
    # シェル版には --version がないため、直接機能テスト
    (testpath/"Ignorefile").write("Node\n")
    system bin/"ignore", "update"
    assert_predicate testpath/".gitignore", :exist?
    assert_match "node_modules", (testpath/".gitignore").read
  end
end
