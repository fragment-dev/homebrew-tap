require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5124.0.0-darwin-x64.tar.gz"
    sha256 "18abc1b985f6d7790205b1f1ee2220bfae53b728597b77bcd52c80bcc8fe9a40"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5124.0.0-darwin-arm64.tar.gz"
      sha256 "a27c7a94727de9222790a47c7c407ced7287f1efae89e2d03e088359ebc4a7c8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5124.0.0-linux-x64.tar.gz"
    sha256 "2e8e9313004440113112b48af000d91947b6dff248f3252f8243c88c0a0ba8bb"
  end
  version "5124.0.0"
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
