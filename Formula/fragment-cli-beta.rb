require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4590.0.0-darwin-x64.tar.gz"
    sha256 "ca221baeac1c6c9dc969a53cb223bf6ce6bcad65d559a72b287f76bdd1519900"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4590.0.0-darwin-arm64.tar.gz"
      sha256 "7fab6c9a7768faa55ea46009193809b2ad195138b46b16cd3ddbd5324a3f84b7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4590.0.0-linux-x64.tar.gz"
    sha256 "5792bc17e8fec6641f25f7b095fd976d25ad9c6580e4437dcc318e667ccbbc15"
  end
  version "4590.0.0"
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
