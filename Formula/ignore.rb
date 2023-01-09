class Ignore < Formula
    desc "Manage your .gitignore file"
    homepage "https://github.com/acevif/ignore"
    url "https://github.com/acevif/ignore/archive/0.2.0.tar.gz"
    sha256 "cddc75fc53a2a63ce634a46d8831403e080c3cb9865778651491c41bcb45bad0"
    license "Unlicense"
  
    def install
      bin.install "ignore"
    end
  
    test do
    end
  end
  