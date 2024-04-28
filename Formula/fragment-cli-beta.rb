require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4960.0.0-darwin-x64.tar.gz"
    sha256 "c8e05b325239f7fc3b96c62a9b9f33462172d933c064786d7700c564fd495ebb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4960.0.0-darwin-arm64.tar.gz"
      sha256 "2a5e58ff808627523356ab2465ac1f769f9097ee2c2306a5ae2c9f9bfda4a2b8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4960.0.0-linux-x64.tar.gz"
    sha256 "434d420760f58b91db44b52be33af5a916d2acd9a1733e38186038c84449f7c1"
  end
  version "4960.0.0"
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
