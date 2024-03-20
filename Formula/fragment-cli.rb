require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.19-darwin-x64.tar.gz"
    sha256 "79c7e9c1af16a50b95cb31eb687b95e5a22bdfb85be12025e71caac1bc8b1306"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.19-darwin-arm64.tar.gz"
      sha256 "b7b3544c14bd747e5793c33f74e314ea323b706f5d1a3ffdca5111cc60340cbe"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.19-linux-x64.tar.gz"
    sha256 "e051f8bec9ebb60f46adde508d72a628332ffc329f6cddc7d04c0a23110e516a"
  end
  version "2024.3.19"
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
