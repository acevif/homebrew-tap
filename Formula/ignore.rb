class Ignore < Formula
  desc "Manage your .gitignore file (Rust version)"
  homepage "https://github.com/acevif/ignore"
  url "https://github.com/acevif/ignore/archive/refs/tags/0.4.0.tar.gz"
  sha256 "87204070f09a6ea896faeaa5825598d04ba1b2df811975b224d6aef44a67887d"
  license "Unlicense"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
  end

  test do
    # Test version output
    assert_match "ignore", shell_output("#{bin}/ignore --version")

    # Test basic functionality with Ignorefile (no network access)
    (testpath/"Ignorefile").write("paths-ignore:\n  - node_modules/\n")
    system bin/"ignore", "update"
    assert_predicate testpath/".gitignore", :exist?
    assert_match "node_modules", (testpath/".gitignore").read
  end
end
