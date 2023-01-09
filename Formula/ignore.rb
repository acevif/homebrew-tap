class Ignore < Formula
  version '0.2.2'

  desc "Manage your .gitignore file"
  homepage "https://github.com/acevif/ignore"
  url "https://github.com/acevif/ignore/archive/0.2.2.tar.gz"
  sha256 "75bc00b57dfc120ce73a3bc2510f595feaad85df921b3f20c810fbf1a4119a5e"
  license "Unlicense"
  depends_on "yq"

  def install
    bin.install "ignore"
  end

  test do
  end
end
