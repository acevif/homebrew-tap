class Ignore < Formula
  desc "Manage your .gitignore file"
  homepage "https://github.com/acevif/ignore"
  url "https://github.com/acevif/ignore/archive/refs/tags/0.4.0.tar.gz"
  sha256 "87204070f09a6ea896faeaa5825598d04ba1b2df811975b224d6aef44a67887d"
  license "Unlicense"

  depends_on "yq"

  conflicts_with "ignore-rs", because: "both provide 'ignore' command"
  conflicts_with "ignore-sh", because: "both provide 'ignore' command"

  def install
    bin.install "ignore"
  end

  test do
    (testpath/"Ignorefile").write("Node\n")
    system bin/"ignore", "update"
    assert_predicate testpath/".gitignore", :exist?
    assert_match "node_modules", (testpath/".gitignore").read
  end
end
