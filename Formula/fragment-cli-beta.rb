require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5480.0.0-darwin-x64.tar.gz"
    sha256 "2e558568d2d10c82b1634eded72eafedb6a60ec5f039d17c656a53526327e1a0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5480.0.0-darwin-arm64.tar.gz"
      sha256 "c572fe5b4a132d7f123b261d59dd0c6ee03d0f028f7e788da5189ad5123460da"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5480.0.0-linux-x64.tar.gz"
    sha256 "34a4482e49db00ecb8da4c3417b3d7035e44c39bdeddc7c400b523c75ee0715d"
  end
  version "5480.0.0"
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
