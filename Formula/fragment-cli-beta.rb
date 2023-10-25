require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3902.0.0-darwin-x64.tar.gz"
    sha256 "1cc261c5f87fd130c40c7e1ae72cf5657e5da31ff952f8202058d7c22c15e810"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3902.0.0-darwin-arm64.tar.gz"
      sha256 "0d30baf55cbdc78d091a768ba30c897db6d9277b6e6f0bf9879363b221d1a77b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3902.0.0-linux-x64.tar.gz"
    sha256 "767fb13863f0e0ee86f685d457c5ed83206c2263ee7de4be79feb25e94b2ce6f"
  end
  version "3902.0.0"
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
