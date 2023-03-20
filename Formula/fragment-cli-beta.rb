require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2243.0.0-darwin-x64.tar.gz"
    sha256 "2e4c8b7fa4ab82a590acae5ff335b549dac54f060d0f3c6e923062c193e55ff7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2243.0.0-darwin-arm64.tar.gz"
      sha256 "1b35a85debc51c5f2f468677ae46761099b956a788e6bf8bdab779192c2b2e6f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2243.0.0-linux-x64.tar.gz"
    sha256 "4e7474ff572f599112fa88f8bad96e33efec034c92d2a275713b7d90b9ad9f81"
  end
  version "2243.0.0"
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
