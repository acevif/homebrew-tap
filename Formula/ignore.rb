class Ignore < Formula
  version '0.2.1'

  desc "Manage your .gitignore file"
  homepage "https://github.com/acevif/ignore"
  url "https://github.com/acevif/ignore/archive/0.2.1.tar.gz"
  sha256 "9590b603e727b37b60ed4ac8a09418233bd8033d38d5aa5ec3a65895911365b9"
  license "Unlicense"

  def install
    bin.install "ignore"
  end

  test do
  end
end
