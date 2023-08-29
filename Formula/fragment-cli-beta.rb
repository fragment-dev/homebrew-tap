require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3428.0.0-darwin-x64.tar.gz"
    sha256 "4274a3abe193c07c4d9fd7e7eae4aa65c56bfb718fb44c6ba6aea83a07b75d7b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3428.0.0-darwin-arm64.tar.gz"
      sha256 "1920413de2eb4d732b1061cfc823057381f35493d4716c45597e8a3f9067b39e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3428.0.0-linux-x64.tar.gz"
    sha256 "a8535c46cfd757dd6ca510b02397cb4e9f74bc87b3829b0731baa35a3f924fb2"
  end
  version "3428.0.0"
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
