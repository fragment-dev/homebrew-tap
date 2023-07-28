require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3189.0.0-darwin-x64.tar.gz"
    sha256 "dda7f15972904000f89cf76b6d596c1b5a33e2624745530200652d130aa087c8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3189.0.0-darwin-arm64.tar.gz"
      sha256 "5d337a7ac417de8b1e982cea529f7369013ce3a9efdd8278cf1ae4d18135b88b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3189.0.0-linux-x64.tar.gz"
    sha256 "4fe20c10f8c820f56c7fa860acfbba6238c2a6f628a7fc4676961bcf25f36f36"
  end
  version "3189.0.0"
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
