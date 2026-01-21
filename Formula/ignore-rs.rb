class IgnoreRs < Formula
  desc "Manage your .gitignore file (Rust version)"
  homepage "https://github.com/acevif/ignore"
  url "https://github.com/acevif/ignore/archive/refs/tags/0.3.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256_TO_BE_CALCULATED_AFTER_TAG_CREATION"
  license "Unlicense"

  depends_on "rust" => :build

  conflicts_with "ignore", because: "both install 'ignore' binary"

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
