require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4910.0.0-darwin-x64.tar.gz"
    sha256 "0efd5ef3f47757b96ef011a850ba0c34133350d66645f808f96b1e5a409e6210"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4910.0.0-darwin-arm64.tar.gz"
      sha256 "f5d4d10d3dfbefba93f569a0997dae7a6b092c94d10e4626ce56fe6b139d6060"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4910.0.0-linux-x64.tar.gz"
    sha256 "e7cfb6115eb745f203628294acd944f840dfa577443fff1d1a76fc48d73e9e8c"
  end
  version "4910.0.0"
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
