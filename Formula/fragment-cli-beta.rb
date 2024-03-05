require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4708.0.0-darwin-x64.tar.gz"
    sha256 "80aaf14fce7a9ebc78d3cc09aa9c831b9170d37b2ec1764e5f59355465e73dd4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4708.0.0-darwin-arm64.tar.gz"
      sha256 "daeb1a5af203312c320134df349c1db4ee54cf4438b2f873c91c24790ebfd044"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4708.0.0-linux-x64.tar.gz"
    sha256 "459c64a733d2fe1a61f910075c94e18998a236c8229edab81e2cce2d27dd68ec"
  end
  version "4708.0.0"
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
