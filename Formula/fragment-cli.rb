require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.20-1-darwin-x64.tar.gz"
    sha256 "1c60ba31db7da8e44c3c15374ff80755d59166291bd704b20f70a33624906edb"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.20-1-darwin-arm64.tar.gz"
      sha256 "a846b51342bcbaaa3efcbcf2ee594e67e47c733838dc941ce4c3c309b104e51b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.20-1-linux-x64.tar.gz"
    sha256 "129ff77fcf0836a40988374d2a9eb2a234f90def45ebfaba0de04483b3d9afbc"
  end
  version "2024.6.20-1"
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
