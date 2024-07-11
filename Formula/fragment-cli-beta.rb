require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5380.0.0-darwin-x64.tar.gz"
    sha256 "590ea1d329c539134621afb7010a9a7f3dc02540275172236a5d87f939697bff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5380.0.0-darwin-arm64.tar.gz"
      sha256 "e1f3b82fbc83740f5d89081392c7daa35d0faaae9418a67f2a8a4646f3790ad9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5380.0.0-linux-x64.tar.gz"
    sha256 "f0cee27f65dfd8131859ec643d48db1a1d250667012d1e8cb5abb08b17dfe621"
  end
  version "5380.0.0"
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
