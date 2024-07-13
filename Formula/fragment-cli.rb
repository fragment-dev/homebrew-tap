require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.12-darwin-x64.tar.gz"
    sha256 "24b1adfc580c4e4d5941fa45a843813a46209ec60a6e58f8e41f365465bc7265"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.12-darwin-arm64.tar.gz"
      sha256 "7b6cbff1c920e92a781ee5265c88aaa52600103d9b145a6f1c770714a8fccfe6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.12-linux-x64.tar.gz"
    sha256 "9928a1b4a117ff6c296233db7d38475e89ed21a8dfef46e5f555661f3079bbe4"
  end
  version "2024.7.12"
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
