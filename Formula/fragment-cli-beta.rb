require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4440.0.0-darwin-x64.tar.gz"
    sha256 "e3db98163812b0dd6e09186973b2f608ef04bd9da2cecfc9923f8cd4008be747"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4440.0.0-darwin-arm64.tar.gz"
      sha256 "adfbe7527404d724f3b22a9de3f343016b348ecbe036b19d15057ba1e4b84dff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4440.0.0-linux-x64.tar.gz"
    sha256 "fd90bc8c88346807d9cf0e1c6e6abff953c2ba138bf4bbeff2363a474d8acec2"
  end
  version "4440.0.0"
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
