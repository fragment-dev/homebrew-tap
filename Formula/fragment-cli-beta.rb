require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3548.0.0-darwin-x64.tar.gz"
    sha256 "2711e7e6053b94197d335e1f08e7324de55a4643b246a0fde07905a6d0403c0d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3548.0.0-darwin-arm64.tar.gz"
      sha256 "735a807de0004aa8a53e187722ef2172cc5818c19d3c594d0f4abe04ffa7e049"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3548.0.0-linux-x64.tar.gz"
    sha256 "be579bb61f18eb4283c5492a032846969aa553590a1d09a79494c75225e4d2dc"
  end
  version "3548.0.0"
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
