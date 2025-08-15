require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.14-1-darwin-x64.tar.gz"
    sha256 "b8d6b803e96e307ebfc04e04fb4e199c6484d2fe18254135a62d0c1e5ffd2873"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.14-1-darwin-arm64.tar.gz"
      sha256 "cc71f3584d8fe280942ec43028e742120a201e8f5f8adbfa5f1c86f1d881ecaa"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.14-1-linux-x64.tar.gz"
    sha256 "b9dfdbb3e8316ecfb1231f3cf4f4f3afb1d9e40421b0ae0d3237b95de9a9f5de"
  end
  version "2025.8.14-1"
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
