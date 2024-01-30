require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4462.0.0-darwin-x64.tar.gz"
    sha256 "592d1112e4df7831dca44480a815c6f55d8dcef979779f14f6a6135ef7f3af19"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4462.0.0-darwin-arm64.tar.gz"
      sha256 "cac59c1b3f9ac72874084fd4abee5999069557134beff6681b52a7447a4ff719"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4462.0.0-linux-x64.tar.gz"
    sha256 "a918eaa1761ef437b10e2da2c3dbeda9062d179325202bbfdfa29ee0ed733fbe"
  end
  version "4462.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
