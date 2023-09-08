require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3512.0.0-darwin-x64.tar.gz"
    sha256 "63b3654fc933136ca8161703365c94d0b00f3f89b2a50a09f51f321bde3e6e37"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3512.0.0-darwin-arm64.tar.gz"
      sha256 "ae2fb48de79f5c3832c4cb3e84ba088308272811d911402f75722e63d20cea81"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3512.0.0-linux-x64.tar.gz"
    sha256 "a62ebcf0a61b92e41a7879068d99650e9aeda8396860555cba7dff1f6b3c32fa"
  end
  version "3512.0.0"
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
