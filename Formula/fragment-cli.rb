require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.16-darwin-x64.tar.gz"
    sha256 "c08ff9ab42ce8131de0667b1cbb380269bf47ca2ceec2d06225722b90bd6830e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.16-darwin-arm64.tar.gz"
      sha256 "1d876f89f898b48614e23a96dbdb39fb6092f7052596558d2f00ba285fa5774d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.16-linux-x64.tar.gz"
    sha256 "0ba0c7947f3401322c7eec8562c5a1d63890842a63b0481d3b33b03afd5bddc9"
  end
  version "2024.7.16"
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
