require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2251.0.0-darwin-x64.tar.gz"
    sha256 "8fead60eae417f38a9f1990303a9b7333eef666ee506f3cbf1c48d27585b0a72"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2251.0.0-darwin-arm64.tar.gz"
      sha256 "4e11ca7dac2c666383061d9919840937b10e89d22c265f52dcfb8cb6e108f639"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2251.0.0-linux-x64.tar.gz"
    sha256 "c3cc931d37f3da6c39ee923d342bfea92d2fd694fd732bc95234fb39740c3a36"
  end
  version "2251.0.0"
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
