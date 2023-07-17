require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3091.0.0-darwin-x64.tar.gz"
    sha256 "a8c40923c49de3beb65dee180c22adbe1f126bfa083544fd19848b1b7bfe3269"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3091.0.0-darwin-arm64.tar.gz"
      sha256 "3bbd2ba8bfdd7b3af0303fe1e0e6b6b2d0d4e8661ecb5c1b6f2e41d5c76d67ec"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3091.0.0-linux-x64.tar.gz"
    sha256 "0d52d3b2c5b200046fcf1aac06b583be8f7fbfa18e9a4b56e46c74568ca92074"
  end
  version "3091.0.0"
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
