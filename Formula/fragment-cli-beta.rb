require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2291.0.0-darwin-x64.tar.gz"
    sha256 "5c3da17188217616859c256c4ecf952ac69842b20c2228742865729e7faf0e67"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2291.0.0-darwin-arm64.tar.gz"
      sha256 "6a0542391d8a0537b41e732a1e041de265cbe68a8e57fe8b6047008d1cc22462"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2291.0.0-linux-x64.tar.gz"
    sha256 "8913fc10157818214f38ee35e0ba6a57078515f17c5e0a21a2234b881c01c07a"
  end
  version "2291.0.0"
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
