require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3669.0.0-darwin-x64.tar.gz"
    sha256 "4f6d013192fa93afdd1d4dba698dde6a60e93ca05a65c5ba0106a0539365bc88"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3669.0.0-darwin-arm64.tar.gz"
      sha256 "3c571e2a72c78f7f01fc4699455fc139eac85e94bd6ed9fd0231cb21594c57c9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3669.0.0-linux-x64.tar.gz"
    sha256 "07e64eba3c63a3310f1fb80c5f98a412fc082ce8dc98de327c408323b02e255a"
  end
  version "3669.0.0"
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
