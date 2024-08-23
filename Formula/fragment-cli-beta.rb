require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5533.0.0-darwin-x64.tar.gz"
    sha256 "02a534d37b4e61ed5d4eb1feaccf0d91f2edc4d5bf80127d7271f0d4e598a872"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5533.0.0-darwin-arm64.tar.gz"
      sha256 "e6344b23533dd14cb6811a717c937d80c51245c0ac296b9283ece75c80374e2f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5533.0.0-linux-x64.tar.gz"
    sha256 "ee283e4819e08acc9bc5324c699373167116ede7f521d2952bdd0d52e9fb5590"
  end
  version "5533.0.0"
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
