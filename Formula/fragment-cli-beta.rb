require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2597.0.0-darwin-x64.tar.gz"
    sha256 "00e1200ffe265eb7425a8b411ebda23af6a2fb6e1e79bd1f505214e8d1713cf4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2597.0.0-darwin-arm64.tar.gz"
      sha256 "64c865d1d185739239aab950e8d9c397b9f414bc047e077788ec0a8b62d58eb3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2597.0.0-linux-x64.tar.gz"
    sha256 "b4adc40e9d5742ce1e842a1470364c5e289abeefa7113438568abfaabd49ed0b"
  end
  version "2597.0.0"
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
