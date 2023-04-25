require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2517.0.0-darwin-x64.tar.gz"
    sha256 "70b11337763965b8648395a8c9dc1227b44c263f93d0eb927e04356074828eec"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2517.0.0-darwin-arm64.tar.gz"
      sha256 "9e8858d834f217b74385af71566ef41fd0e762137ecbe9aaaf7a6297926461d1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2517.0.0-linux-x64.tar.gz"
    sha256 "c76d5dccba8d2c18906828fee2af83e265ecaf98167e02d094c27ce33c973b31"
  end
  version "2517.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
