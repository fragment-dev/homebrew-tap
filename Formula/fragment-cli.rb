require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.9-2-darwin-x64.tar.gz"
    sha256 "5fad5068bb5ecec4d5306916f854cd5096b32cd7fa3ee835037d4722a72fa362"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.9-2-darwin-arm64.tar.gz"
      sha256 "520cc7b9a1b0b6b6f7d91c34556a5307ce6c612f74aa2a6d668f5503447feb1e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.9-2-linux-x64.tar.gz"
    sha256 "6a652c5a56874af4f94fb4cae1831b7b7881db03b33a009bc704e0efb0b7b396"
  end
  version "2025.1.9-2"
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
