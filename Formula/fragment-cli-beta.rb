require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2438.0.0-darwin-x64.tar.gz"
    sha256 "9d10e8b054ec70b5fb2c9fbc4f91ed6b1d623128e34f9928c0666b664051b938"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2438.0.0-darwin-arm64.tar.gz"
      sha256 "227cfce0c349ca377a0ac1740b0da8068f69ca8b39beaa4fa939cf92861f6b6c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2438.0.0-linux-x64.tar.gz"
    sha256 "83e9d3ff92a0380f1d64d0d135dde4095add34dedc22d14484f09b6c3ad3b564"
  end
  version "2438.0.0"
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
