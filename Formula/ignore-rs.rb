class IgnoreRs < Formula
  desc "Manage your .gitignore file (Rust version)"
  homepage "https://github.com/acevif/ignore"
  url "https://github.com/acevif/ignore/archive/refs/tags/0.3.1.tar.gz"
  sha256 "9d12a03e25b15f19c0c5f9e4d4c12491f03de17fce2959ea1bd2483839831a13"
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
