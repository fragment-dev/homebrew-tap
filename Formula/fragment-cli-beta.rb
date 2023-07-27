require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3180.0.0-darwin-x64.tar.gz"
    sha256 "c86e22331b2c0df906bf7a1d45d453526ee6269c6844254007f23a869d7fb4de"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3180.0.0-darwin-arm64.tar.gz"
      sha256 "8f43968a38d27fc8107a0c3c31ced735656c1b4440df101c63f1d47fefed50a1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3180.0.0-linux-x64.tar.gz"
    sha256 "fa29b6fc05424fce0d09721eb1548e090694f08b091912c5a7e87660fdb6a406"
  end
  version "3180.0.0"
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
