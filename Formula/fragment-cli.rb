require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.28-darwin-x64.tar.gz"
    sha256 "13a75c9c4be97a9b591112b01fcda2dab9f9206c49aaa0c5d27acd0c082f9b56"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.28-darwin-arm64.tar.gz"
      sha256 "7dea0ba35900934aaab1c6a497c8efa7d491611e61d4082ab0aba8af26861c10"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.28-linux-x64.tar.gz"
    sha256 "79b0162fe220f3d86a5cd57266a41ba007a81a02467de3f472154c2a34f40f5f"
  end
  version "2025.1.28"
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
