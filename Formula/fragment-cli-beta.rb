require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5444.0.0-darwin-x64.tar.gz"
    sha256 "476bc46c6d218632096331bc4b9298b05329a7b7bfaeb8133e7e8be80741dc90"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5444.0.0-darwin-arm64.tar.gz"
      sha256 "d1bbfc7fb99aa5c486ff02abba99d7a3d6914784de849fa2a8e33b6f7ee839ac"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5444.0.0-linux-x64.tar.gz"
    sha256 "14eb762b7a531e064f187d8f2dfd96954860fd6f665e39f311f1349e533a6330"
  end
  version "5444.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
