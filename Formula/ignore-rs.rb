class IgnoreRs < Formula
  desc "Manage your .gitignore file (Rust version)"
  homepage "https://github.com/acevif/ignore"
  url "https://github.com/acevif/ignore/archive/refs/tags/0.3.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256_TO_BE_CALCULATED_AFTER_TAG_CREATION"
  license "Unlicense"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
  end

  test do
    assert_match "ignore", shell_output("#{bin}/ignore --version")
  end
end
