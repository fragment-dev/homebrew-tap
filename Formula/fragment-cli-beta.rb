require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6075.0.0-darwin-x64.tar.gz"
    sha256 "1a16303330ceefa30b692bb0c79d74421c7cc9a5d8643a5b4e7052676520b86f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6075.0.0-darwin-arm64.tar.gz"
      sha256 "558f06e71c8d2e4ede50fe5730fedbedd0c57a6d847aae12c69b739bf7c361de"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6075.0.0-linux-x64.tar.gz"
    sha256 "ca6cb699f2f8201ef4b092e00403eb6f04c68242f8a15e74f9dd47bd922dd564"
  end
  version "6075.0.0"
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
