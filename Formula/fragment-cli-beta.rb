require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2334.0.0-darwin-x64.tar.gz"
    sha256 "9baa0d4b0ff96ae4433968994e87d7e6f7fbad3a224b92a144cb0665e1749a88"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2334.0.0-darwin-arm64.tar.gz"
      sha256 "ac3547cec7d1b2af33f11b3e502398259bb130cc6bfbb598af38fa2e6a6cf558"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2334.0.0-linux-x64.tar.gz"
    sha256 "6829fdf91cbb54708dacf9116526ca7da0f35d32c52aa9c065db1d8d9ea9360c"
  end
  version "2334.0.0"
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
