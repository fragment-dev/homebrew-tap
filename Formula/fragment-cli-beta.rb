require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4239.0.0-darwin-x64.tar.gz"
    sha256 "4fa3b8a3725bd1f01205020ace69f990315bd16d8c9627637c928011416445a9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4239.0.0-darwin-arm64.tar.gz"
      sha256 "d234578553846ead4ab1e18d9b44e4a8d56502d8ac52ebe4665931b2fa2a314b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4239.0.0-linux-x64.tar.gz"
    sha256 "6511a96dee7582bfe197441ae9f814453b23626527b791969acba316a4207761"
  end
  version "4239.0.0"
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
