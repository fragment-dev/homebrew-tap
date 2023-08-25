require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.25-2-darwin-x64.tar.gz"
    sha256 "ba4806fbab8ffc5251a8421f3a6d234e8323f2251fa5025e315ef76ac86b4aaa"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.25-2-darwin-arm64.tar.gz"
      sha256 "c00490611e8975d6fea75ea46c433738a57d3f7a042b3c9a628b868cdf0e6cf9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.25-2-linux-x64.tar.gz"
    sha256 "b18d6317d93a957b81b293cf0f9f21b74b083e2a5d404c0f811d2d361016d0ac"
  end
  version "2023.8.25-2"
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
