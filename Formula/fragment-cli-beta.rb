require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3680.0.0-darwin-x64.tar.gz"
    sha256 "2be1652a0dfb53738d93223d84192c6558838674feb51413c61e86dd9ec43308"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3680.0.0-darwin-arm64.tar.gz"
      sha256 "5e52cfe17db97796fdbbeda777b4983f0f6b1477f93f18e32c8d456cecc1f3fe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3680.0.0-linux-x64.tar.gz"
    sha256 "348bc9d3f80af4b27f39792fd15ed36177c56aa6868473e1a74359805ddddefa"
  end
  version "3680.0.0"
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
