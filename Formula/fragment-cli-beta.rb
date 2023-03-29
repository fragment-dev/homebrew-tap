require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2309.0.0-darwin-x64.tar.gz"
    sha256 "11f7a999a35185b5937e32bc0a674387417d67668c6e9423d2e36b93f94db418"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2309.0.0-darwin-arm64.tar.gz"
      sha256 "16b28bcd097d4588b01de51ee13d5f8a18aeb15357209430a4b1359a2493939d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2309.0.0-linux-x64.tar.gz"
    sha256 "981dbff3c92224b13e7856434e0be96e7a37f13f823e2f06798cddc15032dd63"
  end
  version "2309.0.0"
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
