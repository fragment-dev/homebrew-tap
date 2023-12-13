require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4156.0.0-darwin-x64.tar.gz"
    sha256 "87e1993a2b7cc6264e7773a514df7c1bb035ffc2c49b6146cca168d7d0f1d8cf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4156.0.0-darwin-arm64.tar.gz"
      sha256 "e1ced93cd4202b3eb325d4e5a3d6095b49f322576745d895e3081e9ccf349723"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4156.0.0-linux-x64.tar.gz"
    sha256 "0e4bb04d357cfde02f430376e629c24678a9df028649cd151265c318a2ae3377"
  end
  version "4156.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
