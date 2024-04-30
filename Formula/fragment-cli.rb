require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.30-darwin-x64.tar.gz"
    sha256 "34e393ca0614a214c37210f94f10645822691a40e687426d39c299380102f71c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.30-darwin-arm64.tar.gz"
      sha256 "fc38a34aabf9b7441027c54796f1409efe397a2c87367714fb995d5233ec89e0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.30-linux-x64.tar.gz"
    sha256 "6145a01b469d1653d5c742bf6dac6619f1105abba47b5901ca86a6ab45be1b73"
  end
  version "2024.4.30"
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
