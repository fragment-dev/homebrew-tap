require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5281.0.0-darwin-x64.tar.gz"
    sha256 "db4d62d7a2d77b16c34236f2fc801a3d775ddb6a6c55b2e665a5c7c77fe0fd0d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5281.0.0-darwin-arm64.tar.gz"
      sha256 "2dd57f9bf00dcbb38ecb996693031266fd6df4341eeb4a468d96d0cb1a768c1c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5281.0.0-linux-x64.tar.gz"
    sha256 "f222a203ddc555e6c9175192034a2033174210f4203ac462a1f1dca3f96696ad"
  end
  version "5281.0.0"
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
