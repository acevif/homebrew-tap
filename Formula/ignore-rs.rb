class IgnoreRs < Formula
  desc "Manage your .gitignore file (Rust version)"
  homepage "https://github.com/acevif/ignore"
  url "https://github.com/acevif/ignore/archive/refs/tags/0.3.2.tar.gz"
  sha256 "422002a68cb1daa23caa825332d94ed425c5b18b20e27c6e1ecd10286d6919ab"
  license "Unlicense"

  depends_on "rust" => :build

  conflicts_with "ignore", because: "both provide 'ignore' command"
  conflicts_with "ignore-sh", because: "both provide 'ignore' command"

  def install
    cd "rust" do
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
  end

  test do
    # Test version output
    assert_match "ignore", shell_output("#{bin}/ignore --version")

    # Test basic functionality with Ignorefile
    (testpath/"Ignorefile").write("Node\n")
    system bin/"ignore", "update"
    assert_predicate testpath/".gitignore", :exist?
    assert_match "node_modules", (testpath/".gitignore").read
  end
end
