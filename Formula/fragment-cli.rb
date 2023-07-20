require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.19-3-darwin-x64.tar.gz"
    sha256 "cb8e3f8de8ac66bdc593506177ba3cb729b2d5e92f4d9d63ad8a2f1098c75697"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.19-3-darwin-arm64.tar.gz"
      sha256 "4b20cb0664eab8034b2ac1aa7bd53c59a8debecc6cde7f7e9cffb0e9ccbe2f88"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.19-3-linux-x64.tar.gz"
    sha256 "bca9b56acc7249aa4f06c9cbcd1729901d01e5fabc0f85e388b5d4b6ca8b0d3c"
  end
  version "2023.7.19-3"
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
