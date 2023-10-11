require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3807.0.0-darwin-x64.tar.gz"
    sha256 "4a081247a27b0043dcaf6f88ba5bf068fa2d9d6749a5ff0aa342cb367f0ba50b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3807.0.0-darwin-arm64.tar.gz"
      sha256 "f3c94b8145d2b74769a66d85190891804a9465d4d1c76c25a061487a859935d5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3807.0.0-linux-x64.tar.gz"
    sha256 "f4ddbcfb279de9da9494c5a4a1d19fd74ebdefacf1b6411eebed70c2f0fb46d3"
  end
  version "3807.0.0"
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
