require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.19-4-darwin-x64.tar.gz"
    sha256 "2af41ade2e99822ba7e1108f9b715ddf5b79b0f2c5e8d692cbe427bd6b4323d5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.19-4-darwin-arm64.tar.gz"
      sha256 "de0ea6c51010c61a7a0fe5511458958e9773777672bd61fb9bf9d98da2e1ab1c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.19-4-linux-x64.tar.gz"
    sha256 "b912b03b7e6ecfa172771a72dce5145ef8d058622efac81aac0a9717ca8e32cf"
  end
  version "2023.4.19-4"
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
