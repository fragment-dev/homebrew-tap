require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2648.0.0-darwin-x64.tar.gz"
    sha256 "246a73f5a7e811f70eda0a983e9c8ebfdc0672ed98ab736be8f56fe9c0f1e918"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2648.0.0-darwin-arm64.tar.gz"
      sha256 "460ed6d671487debf0b38484fd0cda13fac21f4e5bf2004ac0b838039ca6eb5a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2648.0.0-linux-x64.tar.gz"
    sha256 "2260dc653db9fbc0a2134f807d5f52a18ec8c56e2d82e80b7fd9fb06ca535d07"
  end
  version "2648.0.0"
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
