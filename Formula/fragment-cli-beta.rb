require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4643.0.0-darwin-x64.tar.gz"
    sha256 "57ad596fc88c8ec80a820e9ff06e9d438fff70701e21bd88e55c66e46ee0238b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4643.0.0-darwin-arm64.tar.gz"
      sha256 "e0fae18ac1a517957357e0567b0b6d6f3bdb41c03e894f6bb95be36688e364ed"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4643.0.0-linux-x64.tar.gz"
    sha256 "9622fad69eb8adaa4edcf6e64519375f05024cfd55bea12674834314480f9afa"
  end
  version "4643.0.0"
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
