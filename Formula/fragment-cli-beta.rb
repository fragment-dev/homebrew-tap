require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3780.0.0-darwin-x64.tar.gz"
    sha256 "a8cef8c23ced24cfa9244ce4bbc0db105536496b0729bcfd0c25d0429333a00a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3780.0.0-darwin-arm64.tar.gz"
      sha256 "24a003dc15af3bac433500c6f50a43feff1408d48a1dac34282c5a09e2110ee2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3780.0.0-linux-x64.tar.gz"
    sha256 "6bf6d3c151b6ee08bd9b84b3cbed83909e7ca25a3fe3d7dd9bc77c099c63ae75"
  end
  version "3780.0.0"
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
