require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2413.0.0-darwin-x64.tar.gz"
    sha256 "05021bb360ae165b271062e3abee82d4ab07c7259fdb1f85b72d603c0dbd9741"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2413.0.0-darwin-arm64.tar.gz"
      sha256 "2e116401b39b9e4ae61e9369e0397dfbf9e9a172fdbd158333b057a9a24ef641"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2413.0.0-linux-x64.tar.gz"
    sha256 "90b1dfe270407b77027ad41697cc90c597d7e77aa3501e0c5997cdf9743d04bb"
  end
  version "2413.0.0"
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
