require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3249.0.0-darwin-x64.tar.gz"
    sha256 "80b50a348e0c01898e8f837d548c5d608094d25fba03cbbcfa7b2a9ec217869f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3249.0.0-darwin-arm64.tar.gz"
      sha256 "fd350e53792afb2847d1e34c56ae1bd6f5b730a3984e5e41199db363ce618797"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3249.0.0-linux-x64.tar.gz"
    sha256 "d8e0c7df61b2d62516189e1d50db9bd70da352b7e7d16650224c9cfaf43931af"
  end
  version "3249.0.0"
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
