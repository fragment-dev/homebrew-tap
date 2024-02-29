require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4665.0.0-darwin-x64.tar.gz"
    sha256 "7fd6dd7b7b8a7cfaf03e86999e79a2a619f74dd1f6e9835a156bdef05c20ef67"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4665.0.0-darwin-arm64.tar.gz"
      sha256 "9944b06433e7db85286739c9912ff1533d47deb359cfac76e72deaf78c957083"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4665.0.0-linux-x64.tar.gz"
    sha256 "a6892de82ce613969c348c11078f994f480ea98695f00a436a9d20de03ff2e85"
  end
  version "4665.0.0"
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
