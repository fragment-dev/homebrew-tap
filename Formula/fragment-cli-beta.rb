require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6036.0.0-darwin-x64.tar.gz"
    sha256 "6ae80b7526aa7f333dfc174a7d0705cfca79d2f3705b00798011aaab3cee7d93"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6036.0.0-darwin-arm64.tar.gz"
      sha256 "24dab70e5bf24836d0978a1719ba6b80ffdd3486ec31dc9d9c6d6b1619a17b6e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6036.0.0-linux-x64.tar.gz"
    sha256 "79657dd50cd2769baa524aadf793096d00a056d715c5dcfe8b02b2000f5d7915"
  end
  version "6036.0.0"
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
