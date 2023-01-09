class Ignore < Formula
  version '0.2.2'

  desc "Manage your .gitignore file"
  homepage "https://github.com/acevif/ignore"
  url "https://github.com/acevif/ignore/archive/0.2.2.tar.gz"
  license "Unlicense"

  def install
    bin.install "ignore"
  end

  test do
  end
end
