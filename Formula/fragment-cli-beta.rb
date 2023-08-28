require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3412.0.0-darwin-x64.tar.gz"
    sha256 "35a4465897f81c1e93ed0b24e0ad0952d93729e41c5232642e64d429a1c2a2fb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3412.0.0-darwin-arm64.tar.gz"
      sha256 "6cabd64297fdc922a4f1b1fe44846d1b1e301c8a3bd7d50020df64b7bc3687a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3412.0.0-linux-x64.tar.gz"
    sha256 "7fb234ae37845808b68bd6975b49892779b8609cf644aac3056a5db3d3be7f1c"
  end
  version "3412.0.0"
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
