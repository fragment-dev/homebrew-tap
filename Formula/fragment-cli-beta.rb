require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5799.0.0-darwin-x64.tar.gz"
    sha256 "da17da6874a0f726afafd77a2a33ebbbab9494e1d4af15db7d5fb24a9ccb513e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5799.0.0-darwin-arm64.tar.gz"
      sha256 "7bb385ef4b96bbf85baea896640b3c0b955176e74094fd32a6903a3da3436aad"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5799.0.0-linux-x64.tar.gz"
    sha256 "42d0985510ed50d1a93d55b5ed1847bc7c482b310d3a23a4a4d90b07f377873d"
  end
  version "5799.0.0"
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
