class Ignore < Formula
  desc "Manage your .gitignore file"
  homepage "https://github.com/acevif/ignore"
  url "https://github.com/acevif/ignore/archive/refs/tags/0.3.1.tar.gz"
  sha256 "9d12a03e25b15f19c0c5f9e4d4c12491f03de17fce2959ea1bd2483839831a13"
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
